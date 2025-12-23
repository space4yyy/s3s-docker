# s3s-docker

Docker image for [nxapi](https://github.com/samuelthomas2774/nxapi) and [s3s](https://github.com/frozenpandaman/s3s)

## Build
s3s commit id is set to `732c91e`
```bash
docker build -t space4y/nxapi-s3s:0.7.0 .
```

## Usage


Note: Use the `-v` option to map the local directory where `gear_*.json` will be saved to the container's `/data` directory.

```bash
docker run -v /path/to/data:/data --rm space4y/nxapi-s3s:0.7.0
```

The data directory should contain:
- `gear_*.json`

Upload the generated `gear_*.json` to [splat3seedchecker](https://leanny.github.io/splat3seedchecker/#/settings) to get your seed.
