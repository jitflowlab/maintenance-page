const express = require('express');
const http = require('http');
const fetch = require('node-fetch');
const fs = require('fs');
const path = require('path');

const app = express();
const server = http.createServer(app);

async function main () {
    const port = process.env['EXPRESS_PORT'] || 3000;
    const url = process.env['HTML_FILE'] || null;
    let content = '';

    if (url) {
        const res = await fetch(url);
        content = await res.text();
    } else {
        content = fs.readFileSync(path.join(__dirname, '/template.html'), 'utf-8');
    }

    app.use(async function (req, res) {
        res.send(content);
    });

    console.log('Listening on port:', port);

    server.listen(port);
}

main()
    .catch(e => {
        console.log('Error:');
        console.log(e);
    });
