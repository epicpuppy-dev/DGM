import { Script, Task } from "npm:@epicpuppy-dev/script-utils";
import tasks, { ServerVersion } from "../lib/tasks.ts";
import data from "./init.data.ts";
import process from "node:process";
import Enquirer from "npm:enquirer";
import { downloadFile } from "../lib/util.ts";
import { readdirSync, renameSync, writeFileSync } from "node:fs";
import { execSync } from "node:child_process";

const prompt = Enquirer.prompt;

const checkVersion = new Task<[ServerVersion], [ServerVersion]>(
    "checkVersion", "Validate Server Version", ["serverVer"], ["serverVer"], async (r, ver) => {
        let environment = ver.env;
        if (!environment) {
            environment = await prompt({
                type: "select",
                name: "environment",
                message: "Which server environment do you want to use?",
                choices: ["vanilla", "paper", "fabric", "(neo)forge"]
            });
        }
        r.log("Using Environment: " + environment);
        let version = ver.version;
        // Validate version number
        if (version && !data.versions.includes(version)) {
            r.warn(`The version ${version} is not supported.`);
        }
        if (!version) {
            version = await prompt({
                type: "select",
                name: "version",
                message: "Which Minecraft version should the server use?",
                choices: data.versions
            });
        }
        r.log("MC Version: " + version);
        return [{env: environment, version}];
});

async function downloadVanilla(ver: string) {
    // Get mojang version manifest
    const manifest = await (await fetch("https://piston-meta.mojang.com/mc/game/version_manifest.json")).json();
    // Get the version manifest for the specified version
    const versionManifest = manifest.versions.find((v: { id: string }) => v.id === ver);
    if (!versionManifest) {
        console.error(`Version ${ver} not found.`);
        return;
    }
    // Get the URL for the server jar
    const versionData = await fetch(versionManifest.url);
    const versionDataJson = await versionData.json();
    const serverJarUrl = versionDataJson.downloads.server.url;
    // Download the server jar
    await downloadFile(serverJarUrl, `./server.jar`, true);
}

async function downloadPaper(ver: string) {
    // Get build manifest
    const manifest = await (await fetch(`https://api.papermc.io/v2/projects/paper/versions/${ver}/builds`)).json();
    // Get the latest build
    const latestBuild = manifest.builds[manifest.builds.length - 1].build;
    // Get the URL for the server jar
    const serverJarUrl = `https://api.papermc.io/v2/projects/paper/versions/${ver}/builds/${latestBuild}/downloads/paper-${ver}-${latestBuild}.jar`;
    // Download the server jar
    await downloadFile(serverJarUrl, `./paper.jar`, true);
}

async function downloadFabric(ver: string) {
    const manifest = await (await fetch(`https://meta.fabricmc.net/v2/versions/loader/${ver}`)).json();
    // Get the latest build
    const fabricVersion = manifest[0].loader.version;
    // Get installer version
    const installer = await (await fetch(`https://meta.fabricmc.net/v2/versions/installer`)).json();
    const installerVersion = installer[0].version;
    // Get the URL for the server jar
    const serverJarUrl = `https://meta.fabricmc.net/v2/versions/loader/${ver}/${fabricVersion}/${installerVersion}/server/jar`;
    // Download the server jar
    await downloadFile(serverJarUrl, `./fabric-loader.jar`, true);
}

const downloadServer = new Task<[ServerVersion], []>(
    "downloadServer", "Download Server Jar", ["serverVer"], [], async (r, ver) => {
        if (ver.version == undefined) {
            r.error("No version specified.");
            throw Error();
        }
        if (ver.env == "vanilla") await downloadVanilla(ver.version);
        else if (ver.env == "paper") await downloadPaper(ver.version);
        else if (ver.env == "fabric") await downloadFabric(ver.version);
        else {
            r.log("Forge and NeoForge environments require manual installation.");
            r.log("Please download the installer with the correct version and place it in the current directory.");
            r.log("Forge: https://files.minecraftforge.net/net/minecraftforge/forge/index_" + ver + ".html", 2);
            r.log("NeoForge: https://projects.neoforged.net/neoforged/neoforge", 2);
            await prompt({type: "input", name: "continue", message: "Press enter to continue"});
            const files = readdirSync(".");
            const forgeFile = files.find(file => (file.includes("forge") || file.includes("neoforge")) && file.includes("installer") && file.endsWith(".jar"));
            if (!forgeFile) {
                r.error("No Forge or NeoForge installer found in the current directory.");
                throw new Error("No installer found");
            }
            r.log(`Found installer: ${forgeFile}`);
            // Move the installer to the correct name
            renameSync(forgeFile, "forge-installer.jar");
            r.log("Running Forge installer...");
            await new Promise((r) => setTimeout(r, 1000));
            execSync("java -jar forge-installer.jar --installServer", {
                stdio: "inherit"
            });
        }
        return [];
    }
)

const configureServer = new Task<[ServerVersion], []>(
    "configureServer", "Configure Server", ["serverVer"], [], async (r, ver) => {
        r.log("All Minecraft servers must conform to the Minecraft End User License Agreement (EULA).");
        r.log("Please read the EULA at https://minecraft.net/eula");
        const agree = await prompt({
            type: "confirm", 
            name: "eula", 
            message: "Do you agree to the EULA?", 
            initial: false
        });
        if (!agree) {
            r.error("You must agree to the EULA to run the server.");
            throw new Error("EULA not agreed");
        }
        writeFileSync("eula.txt", "eula=true\n", { encoding: "utf8" });
        const genScripts = await prompt({
            type: "confirm",
            name: "genScripts",
            message: "Generate start scripts for the server?",
            initial: true
        });
        return [];
});

export default async function init(environment?: string, version?: string) {
    const script = new Script<[ServerVersion]>([tasks.checkJava, checkVersion, downloadServer, configureServer], ["serverVer"]);
    try {
        await script.execute({env: environment, version});
    } catch (_err) {/**/};
    process.exit();
}