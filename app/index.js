import http from 'http';

const port = 80;

async function main() {
  const server = http.createServer(async function (req, res) {
    if (req.url == '/') {
        res.write(JSON.stringify({message: 'SDS, CI/CD, and Binary authorised Demo'}));
        res.end()
    }
  }).listen(port);
}
main().catch(console.error);