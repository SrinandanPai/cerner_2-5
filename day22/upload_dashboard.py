# cerner_2tothe5th_2021
# Download file from New Relic using https://github.com/rafimo/2_power_5/blob/master/2021/ruby/nr_dashboard_download.rb
# and upload it to github issue

import base64
import calendar
import json
import os
from pathlib import Path
import requests
import time

with open("./config.json", "r") as jsonfile:
    config = json.load(jsonfile)

os.system("ruby nr_dashboard_download.rb %s %s" % (config['nr_api_key'],config['nr_guid']))

timestamp = calendar.timegm(time.gmtime())

issue_url = config['url'] + "/repos/%s/%s/issues/%s" % (config['owner'],config['repo'],config['issue_number'])
issue_body = json.loads(requests.get(issue_url, headers={ 'Authorization': "Bearer %s" % config['token'] }).text)['body']

for file in Path('.').glob('*.png'):
    with open(file, "rb") as imageFile:
        content = base64.b64encode(imageFile.read())

    content_url = config['url'] + "/repos/%s/%s/contents/%s/%s/%s" % (config['owner'],config['repo'],config['path'],timestamp,file)
    response = requests.put(content_url, data=json.dumps({'message': 'Upload NR Dashboard', 'content': content.decode('utf-8')}), headers={ 'Authorization': "Bearer %s" % config['token'], "Accept": "application/vnd.github.v3+json" }) 
    issue_body += "%s ![%s](%s?raw=true)" % (file,file,json.loads(response.text)['content']['html_url'])

requests.patch(issue_url, data=json.dumps({'body': issue_body}), headers={ 'Authorization': "Bearer %s" % config['token'], "Accept": "application/vnd.github.v3+json" })
