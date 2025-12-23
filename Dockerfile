FROM nikolaik/python-nodejs

WORKDIR /s3s

RUN npm install --global nxapi@next && \
    git clone https://github.com/frozenpandaman/s3s.git . && \
    git checkout 732c91e && \
    pip install -r requirements.txt && \
    apt update && apt install -yq jq --no-install-recommends && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*
RUN mkdir /data
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
