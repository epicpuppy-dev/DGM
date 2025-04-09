import { cpSync, mkdirSync, readFileSync, rmSync, writeFileSync } from "node:fs";

const files = [
    "data/game/functions/tick.mcfunction",
    "data/game/functions/logic/death.mcfunction",
    "data/game/functions/logic/respawn.mcfunction"
];

export default async function map(mapName: string) {
    const mapDetails = JSON.parse(readFileSync(`res/maps/${mapName}/map.json`, "utf-8"));
    console.log(mapDetails);
    // Remove old world
    rmSync(`world`, { recursive: true, force: true });
    // Create new world
    mkdirSync(`world/datapacks`, { recursive: true });
    // Copy world files
    cpSync(`res/maps/${mapName}/map/region`, `world`, { recursive: true });
    cpSync(`res/maps/${mapName}/map/entities`, `world`, { recursive: true });
    cpSync(`res/maps/${mapName}/map/level.dat`, `world`);
    // Copy datapack
    cpSync(`res/minigame`, `world/datapacks/minigame`, { recursive: true });
    // Replace datapack files
    for (const file of files) {
        let content = readFileSync('res/minigame/' + file, "utf-8");
        for (const key of Object.keys(mapDetails.var)) {
            content = content.replaceAll(`$${key}$`, mapDetails.var[key]);
        }
        writeFileSync(`world/datapacks/minigame/` + file, content);
    }
}