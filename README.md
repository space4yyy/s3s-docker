# s3s-docker

[English](README.md) | [简体中文](README.CN.md)

[GitHub Repository](https://github.com/space4y/s3s-docker)

Docker image for [nxapi](https://github.com/samuelthomas2774/nxapi) and [s3s](https://github.com/frozenpandaman/s3s)


## Build

s3s commit id is set to `732c91e`
```bash
docker build -t space4y/nxapi-s3s:0.7.0 .
```

## Usage

Note: Use the `-v` option to map the local directory where `gear_*.json` will be saved to the container's `/data` directory.

### Basic Usage

```bash
docker run --rm -it -v /path/to/data:/data space4y/nxapi-s3s:0.7.0
```

### Language Support

The container supports both English (default) and Chinese languages. Set the `S3S_LANG` environment variable to change the language:

```bash
docker run --rm -it -v /path/to/data:/data space4y/nxapi-s3s:0.7.0
```

### Output

The data directory should contain:
- `gear_*.json`

Upload the generated `gear_*.json` to [splat3seedchecker](https://leanny.github.io/splat3seedchecker/#/settings) to get your seed.

## Acknowledgements

This project is built upon the excellent work of:

- [nxapi](https://github.com/samuelthomas2774/nxapi) - Nintendo Switch Online API client
- [s3s](https://github.com/frozenpandaman/s3s) - Splatoon 3 data exporter

Special thanks to the developers and contributors of these projects!
