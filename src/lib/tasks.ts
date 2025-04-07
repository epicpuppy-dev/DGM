import { Container, Task } from "npm:@epicpuppy-dev/script-utils";
import { execSync } from "node:child_process";

export interface ServerVersion {
    env?: string,
    version?: string,
}

new Container<ServerVersion>("serverVer");

const checkJava = new Task<[], []>("checkJava", "Check Java Version", [], [], async (r) => {
    function javaError(): never {
        r.error("DGM requres Java 21. Run 'dgm java-help' for more information.");
        throw new Error();
    }
    let version;
    try {
        const output = execSync("java --version").toString("utf8");
        version = /.+ (\d+)\.\d+\.\d+/.exec(output);
    } catch (_err) {
        r.warn("Java is not installed. Please install any version of Java 21.");
        javaError();
    }
    if (version == null) {
        r.warn("Java version is invalid. Please install any version of Java 21.");
        javaError();
    }
    if (version[1] != "21") {
        r.warn(`Incorrect Java version, installed: ${version[0]}. Please install any version of Java 21.`);
        javaError();
    }
    r.log(version[0]);
    return [];
});

export default {
    checkJava
}