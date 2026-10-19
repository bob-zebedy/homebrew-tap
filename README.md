# homebrew-tap

| 版本 | 安装命令 |
| --- | --- |
| 4.x | `brew install --cask bob-zebedy/tap/codexbar` |
| 5.x | `brew install --cask bob-zebedy/tap/codexbar@5` |

> [!WARNING]
> 4.x 版本和 5.x 版本互不兼容

```sh
brew fetch --cask bob-zebedy/tap/codexbar@5             # fetch Homebrew 缓存
brew uninstall --cask --zap bob-zebedy/tap/codexbar     # 卸载 4.x 版本的 CodexBar 并清理数据和偏好设置, 如果需要保留数据, 则不要增加 --zap 参数
brew install --cask bob-zebedy/tap/codexbar@5           # 安装 5.x 版本的 CodexBar
```