import requests
from requests.auth import HTTPBasicAuth

JENKINS_URL = "http://your-jenkins-url/job/test-job/lastBuild/api/json"
USERNAME = "admin"
API_TOKEN = "your_token"

response = requests.get(JENKINS_URL, auth=HTTPBasicAuth(USERNAME, API_TOKEN))

if response.status_code == 200:
    data = response.json()
    build_status = data["result"]
    build_number = data["number"]

    print(f"Latest Build Number: {build_number}")
    print(f"Build Status: {build_status}")
else:
    print("Failed to fetch Jenkins build data")
