import { Script } from "npm:@epicpuppy-dev/script-utils";
import data from "./init.data.ts";
import tasks from "../lib/tasks.ts";

export default async function init() {
    const script = new Script([tasks.checkJava], [], {progressMode: true});
    await script.execute();
}