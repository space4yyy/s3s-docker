#!/bin/bash
set -e

pushd /s3s

echo "生成 session token..."
nxapi nso auth 2>&1 | tee output.txt

SESSION_TOKEN=$(cat output.txt| grep 'session_token:' | head -n1 | sed -E "s/.*session_token: '([^']+)'.*/\1/")

echo "更新 s3s token..."
nxapi util update-s3s-token config.txt --token $SESSION_TOKEN

echo "获取观星种子文件..."
python s3s.py --getseed

mv gear_*.json /data

popd
