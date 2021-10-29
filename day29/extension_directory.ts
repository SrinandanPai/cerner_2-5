/*
   * cerner_2tothe5th_2021
   * Mapping between the extension of submitted file and the GitHub user 
   * so that you can collaborate with the user while working on a language
   * 
   * How to run?
   * > npm install
   * > export GITHUB_TOKEN=<github-token>
   * > tsc -p tsconfig.json
   * > node extension_directory.js
*/
const { Octokit } = require("@octokit/core");
const octokit = new Octokit({ auth: process.env.GITHUB_TOKEN });
let extensionMap = new Map();

async function getSearchResult() {
    const items = [];
    let response: { data: { items: any; total_count: number; }; };
    let page = 1;
    do {
        response = await octokit.request('GET /search/code', {
            q: 'cerner_2tothe5th_2021',
            page: page++
        });
        items.push(...response.data.items);
    } while (items.length < response.data.total_count);

    return items;
}

getSearchResult().then((items) => {
    items.forEach((item) => {
        let fileExtension = item.name.split('.').pop()
        if(!extensionMap.get(fileExtension)) extensionMap.set(fileExtension, new Set());
        extensionMap.set(fileExtension, extensionMap.get(fileExtension).add(item.repository.owner.login));
    });

    console.log("Extension Directory");
    new Map([...extensionMap.entries()].sort()).forEach((value, key) => console.log(key,"->",[...value]));
}).catch((err) => {console.log(err)});