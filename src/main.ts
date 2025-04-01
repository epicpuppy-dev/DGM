import { program } from "npm:commander";
import init from "./cmd/init.ts";

program
    .name("dgm")
    .description("CLI for managing datapack-based minigame maps for Minecraft")
    .version("0.1.0");

program.command("init")
    .description("test")
    .action((opts) => {
        init();
    });

if (import.meta.main) {
    program.parse();
}
