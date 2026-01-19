# s3s-docker - GitHub Actions 配置指南

## 配置 Secrets

为了让 GitHub Actions 能够自动构建并推送镜像到 Docker Hub，您需要在 GitHub 仓库中配置以下 Secrets：

### 1. 获取 Docker Hub Access Token

1. 登录 [Docker Hub](https://hub.docker.com/)
2. 点击右上角头像 → **Account Settings**
3. 选择 **Security** → **New Access Token**
4. 输入描述（如 `github-actions`）
5. 选择权限：**Read, Write, Delete**
6. 点击 **Generate**
7. **复制生成的 token**（只显示一次，请妥善保存）

### 2. 配置 GitHub Secrets

1. 打开您的 GitHub 仓库
2. 进入 **Settings** → **Secrets and variables** → **Actions**
3. 点击 **New repository secret**
4. 添加以下两个 secrets：

#### DOCKERHUB_USERNAME
- **Name**: `DOCKERHUB_USERNAME`
- **Value**: 您的 Docker Hub 用户名（例如：`space4y`）

#### DOCKERHUB_TOKEN
- **Name**: `DOCKERHUB_TOKEN`
- **Value**: 上一步生成的 Access Token

### 3. 验证配置

配置完成后，推送代码到 main 分支即可触发自动构建：

```bash
git push origin main
```

## Workflow 功能说明

### 触发条件
- **Push to main**: 推送到 main 分支时自动构建
- **Tags**: 推送标签（如 `v1.0.0`）时构建并打上相应版本标签
- **Pull Request**: PR 时构建但不推送
- **手动触发**: 在 GitHub Actions 页面手动运行

### 支持的架构
- `linux/amd64` (x86_64)
- `linux/arm64` (ARM 64位)

### 镜像标签策略
- `latest` - 始终指向最新的 main 分支版本
- `0.7.0` - 当前固定版本
- `main` - main 分支的最新构建
- `v*` - Git 标签版本（如推送 `v1.0.0` 会创建 `1.0.0`、`1.0`、`1` 等标签）

### Docker Hub README 同步
每次推送到 main 分支时，会自动将 `README.md` 的内容同步到 Docker Hub 的仓库描述页面。

## 常见问题

### Q: 构建失败显示认证错误
A: 检查 `DOCKERHUB_USERNAME` 和 `DOCKERHUB_TOKEN` 是否正确配置

### Q: README 没有同步
A: 确保 Docker Hub token 有足够的权限（Read, Write, Delete）

### Q: 如何触发新版本构建
A: 创建并推送 Git 标签：
```bash
git tag v1.0.0
git push origin v1.0.0
```

### Q: 如何查看构建日志
A: 进入仓库的 **Actions** 页面查看详细的构建日志

## 手动触发构建

1. 进入 GitHub 仓库
2. 点击 **Actions** 标签
3. 选择 **Build and Push Docker Image** workflow
4. 点击 **Run workflow** 按钮
5. 选择分支后点击 **Run workflow**
