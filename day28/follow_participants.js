/*
   * cerner_2tothe5th_2021
   * Follow all the participants of 'Cerner 2^5 2021' challenge on GitHub
   * How to run?
   * > npm install
   * > export GITHUB_TOKEN=<github-toke>
   * > node follow_participants.js
*/
const { Octokit } = require("@octokit/core");
const octokit = new Octokit({ auth: process.env.GITHUB_TOKEN });
const users = new Set();

async function getSearchResult() {
    const items = [];
    let response;
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
    items.forEach((item) => { users.add(item.repository.owner.login) });

    users.forEach(async (username) => {
        await octokit.request('PUT /user/following/{username}', { username });
    });

    console.log("Following all the participants of 'Cerner 2^5 2021' challenge on GitHub!!!");
}).catch((err) => {console.log(err)});