import { Argument, program } from "npm:commander";
import init from "./cmd/init.ts";
import map from "./cmd/map.ts";

program
    .name("dgm")
    .description("CLI for managing datapack-based minigame maps for Minecraft")
    .version("0.1.0");

program.command("init")
    .description("test")
    .addArgument(new Argument("[environment]", "The environment of the server (vanilla, paper, fabric, [neo]forge)").choices(["vanilla", "paper", "fabric", "neoforge", "forge"]))
    .argument("[version]", "The Minecraft version of the server")
    .action((environment, version) => {
        init(environment, version);
    });

program.command("map")
    .description("Load a map")
    .argument("<mapName>", "The name of the map")
    .action((mapName) => {
        map(mapName);
    });

if (import.meta.main) {
    program.parse();
}
