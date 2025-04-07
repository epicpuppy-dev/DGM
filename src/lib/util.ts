import { createWriteStream, existsSync, mkdirSync } from "node:fs";
import https from 'node:https';
import process from "node:process";
import { clearLine } from "node:readline";

export function downloadFile(url: string, path: string, showBar: boolean = false) {
    // Create directories if they don't exist
    const dir = path.substring(0, path.lastIndexOf('/'));
    if (!existsSync(dir)) {
        mkdirSync(dir, { recursive: true });
    }
    const fileName = path.split("/").slice(-1)[0];
    if (showBar) {
        process.stdout.write(` ${fileName} [                    ] 0%\r`);
    }
    const req = https.get(url);
    req.on('response', (res) => {
        let loaded = 0;
        const total = parseInt(res.headers['content-length'] || '1', 10);
        res.on('data', (chunk) => {
            loaded += chunk.length;
            if (showBar) {
                clearLine(process.stdout, 1);
                const percent = loaded / total;
                if (total <= 1000) process.stdout.write(` ${fileName}...\r`);
                else process.stdout.write(` ${fileName} [${"=".repeat(Math.floor(percent * 20))}${" ".repeat(20 - Math.floor(percent * 20))}] ${Math.floor(percent * 100)}%\r`);
            }
        });
        res.on('end', () => {
            if (showBar) {
                clearLine(process.stdout, 1);
                if (total <= 1000) process.stdout.write(` ${fileName}... done\n`);
                else process.stdout.write(` ${fileName} [${"=".repeat(20)}] 100%\n`);
            }
        })
        res.pipe(createWriteStream(path));
    });
    return new Promise((r) => req.on('end', r));
}