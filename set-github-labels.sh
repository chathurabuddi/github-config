echo ''
echo 'This script will remove the GitHub default labels and create a set of predifined agile-friendly labels for your repo.'
echo 'A personal access token is required to access private repos.'

echo ''
echo -n 'GitHub Personal Access Token: '
read -s TOKEN

echo ''
echo -n 'GitHub Org/Repo (e.g. foo/bar): '
read REPO

REPO_USER=$(echo "$REPO" | cut -f1 -d /)
REPO_NAME=$(echo "$REPO" | cut -f2 -d /)

# Delete default labels
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/bug
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/duplicate
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/enhancement
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/help%20wanted
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/good%20first%20issue
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/invalid
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/question
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/wontfix
curl -u $TOKEN:x-oauth-basic --request DELETE https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels/documentation

#create priority labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Priority/Highest","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Priority/High","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Priority/Normal","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Priority/Low","color":"fbca04"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

#create resolution labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Answered","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Cannot Reproduce","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Duplicate","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Fixed","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Invalid","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Not a bug","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Postponed","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Resolution/Won’t Fix","color":"31a849"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

#create severity labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Severity/Blocker","color":"e82c2c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Severity/Critical","color":"e82c2c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Severity/Major","color":"e82c2c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Severity/Minor","color":"e82c2c"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"

#create issue type labels
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type/Bug","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type/Docs","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type/Improvement","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type/New Feature","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type/Clarification","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
curl -u $TOKEN:x-oauth-basic --include --request POST --data '{"name":"Type/Task","color":"1d76db"}' "https://api.github.com/repos/$REPO_USER/$REPO_NAME/labels"
