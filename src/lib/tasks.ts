import { Container, Task } from "npm:@epicpuppy-dev/script-utils";
import { execSync } from "node:child_process";

const checkJava = new Task<[], []>("checkJava", "Check Java Version", [], [], async (r) => {
    try {
        await new Promise((r) => setTimeout(r, 1000));
        const output = execSync("java --version").toString("utf8");
        const version = /.+ (\d+)\.\d+\.\d+/.exec(output);
        if (version == null) {
            r.error("Java version is invalid. Please install any version of Java 21.");
            throw new Error();
        }
        if (version[1] != "21") {
            r.error(`Incorrect Java version, installed: ${version}. Please install any version of Java 21.`);
        }
    } catch (err) {
        r.error("Java is not installed. Please install any version of Java 21.");
    }
    return [];
});

export default {
    checkJava
}