import { execSync } from "node:child_process";
import { mkdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";

interface MapFile {
    var: {[key: string]: string};
    type: string;
}

const files = [
    "data/game/functions/tick.mcfunction",
    "data/game/functions/logic/death.mcfunction",
    "data/game/functions/logic/respawn.mcfunction"
];

export default function map(mapName: string) {
    const mapDetails = JSON.parse(readFileSync(`res/maps/${mapName}/map.json`, "utf-8")) as MapFile;
    console.log(mapDetails);
    // Remove old world
    rmSync(`world`, { recursive: true, force: true });
    // Create new world
    mkdirSync(`world/datapacks`, { recursive: true });
    // Copy world files
    execSync(`cp -r res/maps/${mapName}/map/* world`);
    // Copy datapack
    execSync(`cp -r res/minigame world/datapacks`);

    // Mode specific files
    if (mapDetails.type === "tdm") {
        tdm(mapDetails);
    } else if (mapDetails.type === "cp") {
        cp(mapDetails);
    }

    // Replace datapack files
    for (const file of files) {
        let content = readFileSync('world/datapacks/minigame/' + file, "utf-8");
        for (const key of Object.keys(mapDetails.var)) {
            content = content.replaceAll(`$${key}$`, mapDetails.var[key]);
        }
        writeFileSync(`world/datapacks/minigame/` + file, content);
    }
}

function tdm(data: MapFile) {
    execSync(`cp -r res/mode/tdm/game world/datapacks/minigame/data`);
}

function cp(data: MapFile) {
    execSync(`cp -r res/mode/cp/game world/datapacks/minigame/data`);
    files.push(...[
        "data/game/functions/display.mcfunction",
        "data/game/functions/load-mode.mcfunction",
        "data/game/functions/scoreboard.mcfunction",
        "data/game/functions/tick-mode.mcfunction"
    ]);
}