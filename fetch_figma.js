require('dotenv').config();
const fs = require('fs');
const https = require('https');

const TOKEN = process.env.FIGMA_TOKEN;
const FILE_KEY = process.env.FIGMA_FILE_KEY;
const NODE_ID = process.env.FIGMA_NODE_ID;

if (!TOKEN || TOKEN === 'YOUR_PERSONAL_ACCESS_TOKEN_HERE') {
    console.error('Error: FIGMA_TOKEN is not set in .env file.');
    process.exit(1);
}

const options = {
    hostname: 'api.figma.com',
    path: `/v1/files/${FILE_KEY}/nodes?ids=${NODE_ID}`,
    headers: {
        'X-Figma-Token': TOKEN
    }
};

console.log(`Fetching Figma data for file ${FILE_KEY} and node ${NODE_ID}...`);

https.get(options, (res) => {
    let data = '';
    res.on('data', (chunk) => data += chunk);
    res.on('end', () => {
        try {
            const json = JSON.parse(data);
            fs.writeFileSync('figma_data.json', JSON.stringify(json, null, 2));
            console.log('Successfully saved Figma data to figma_data.json');
        } catch (e) {
            console.error('Failed to parse response:', e.message);
            console.log('Raw response:', data);
        }
    });
}).on('error', (err) => {
    console.error('API Request Error:', err.message);
});
