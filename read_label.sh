#!/usr/bin/env bash
set -euo pipefail
set -x

PR_NUMBER="$1"
GITHUB_TOKEN="$2"

if [[ "$PR_NUMBER" = "0" || -z "$PR_NUMBER" ]]; then
 echo "This is not a PR"
 exit 1
fi

if [[-z "$GITHUB_TOKEN" ]]; then
 echo "Token not set"
 exit 1
fi

#get all labels in a PR
URL = "https://github.com/semeenaa/TestAutomationProj/$PR_NUMBER/labels"
LABELS=()

while IFS=$'\n' read -r line; do
LABELS+=("${line}")
done < < (curl -s X GET --header "Authorization: token $GITHUB_TOKEN" "$URL" | jq '.[]name')

#print labels
if [[ "${LABELS[@]} -ne 0 ]]; then 
 echo "No labels present"
else
 for labe in ${LABELS[@]}; do
  echo "$i"
 done 
fi
