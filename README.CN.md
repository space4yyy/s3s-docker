# s3s-docker

[English](README.md) | [简体中文](README.CN.md)

[GitHub 仓库](https://github.com/space4y/s3s-docker)

用于 [nxapi](https://github.com/samuelthomas2774/nxapi) 和 [s3s](https://github.com/frozenpandaman/s3s) 的 Docker 镜像


## 构建

s3s commit id 设置为 `732c91e`
```bash
docker build -t space4y/nxapi-s3s:0.7.0 .
```

## 使用方法

注意：使用 `-v` 选项将保存 `gear_*.json` 的本地目录映射到容器的 `/data` 目录。

### 基础用法

```bash
docker run --rm -it -v /path/to/data:/data space4y/nxapi-s3s:0.7.0
```

### 语言支持

容器支持英文（默认）和中文两种语言。设置 `S3S_LANG` 环境变量来切换语言：

```bash
# 英文（默认）
docker run --rm -it -v /path/to/data:/data space4y/nxapi-s3s:0.7.0

# 中文
docker run --rm -it -v /path/to/data:/data -e S3S_LANG=zh space4y/nxapi-s3s:0.7.0
```

### 输出

数据目录应包含：
- `gear_*.json`

将生成的 `gear_*.json` 上传到 [splat3seedchecker](https://leanny.github.io/splat3seedchecker/#/settings) 以获取您的种子。

## 致谢

本项目基于以下优秀项目构建：

- [nxapi](https://github.com/samuelthomas2774/nxapi) - Nintendo Switch Online API 客户端
- [s3s](https://github.com/frozenpandaman/s3s) - Splatoon 3 数据导出工具

特别感谢这些项目的开发者和贡献者！
