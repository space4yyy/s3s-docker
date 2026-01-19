FROM nikolaik/python-nodejs:python3.11-nodejs24

WORKDIR /s3s

# Install system dependencies
RUN apt-get update && \
    apt-get install -yq --no-install-recommends jq git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install nxapi
RUN npm install --global nxapi@next

# Clone s3s and install Python dependencies
RUN git clone https://github.com/frozenpandaman/s3s.git . && \
    git checkout 732c91e && \
    pip install --no-cache-dir -r requirements.txt

# Create data directory
RUN mkdir /data

# Copy and setup entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
