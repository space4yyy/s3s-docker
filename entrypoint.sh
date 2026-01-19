#!/bin/bash
set -e          # Exit on command failure
set -u          # Exit on undefined variable
set -o pipefail # Exit on pipeline failure

# Multi-language support
S3S_LANG="${S3S_LANG:-en}"

if [ "$S3S_LANG" = "zh" ]; then
    # Chinese messages
    MSG_GENERATING="生成 session token..."
    MSG_ERROR="错误: 无法提取 session token"
    MSG_UPDATING="更新 s3s token..."
    MSG_FETCHING="获取观星种子文件..."
else
    # English messages (default)
    MSG_GENERATING="Generating session token..."
    MSG_ERROR="Error: Failed to extract session token"
    MSG_UPDATING="Updating s3s token..."
    MSG_FETCHING="Fetching gear seed file..."
fi

pushd /s3s

echo "$MSG_GENERATING"
nxapi nso auth 2>&1 | tee output.txt

SESSION_TOKEN=$(cat output.txt| grep 'session_token:' | head -n1 | sed -E "s/.*session_token: '([^']+)'.*/\1/")

# Validate session token extraction
if [ -z "$SESSION_TOKEN" ]; then
    echo "$MSG_ERROR"
    exit 1
fi

echo "$MSG_UPDATING"
nxapi util update-s3s-token config.txt --token $SESSION_TOKEN

echo "$MSG_FETCHING"
python s3s.py --getseed

mv gear_*.json /data

popd
