Decision Compass — 交付笔记

目的

- 保存本次会话的重要决策和产物，便于离线查看与后续复现。

本次已完成（简短版）

- 重构并结构化：`packages/01-decision-compass-universal/theology-card.md`（加入版本、Definition Authority、Prompt 模板和示例）。
- 新增 AI 能力包：
  - `ai-prompt-pack/decision-compass-prompt.md`（Prompt 模板）
  - `ai-prompt-pack/sample_input.json`（示例输入）
  - `ai-prompt-pack/GENMINIE_example.md`（GENMINIE 占位调用示例）
- 所有改动已提交并推送到远程分支：`feat/decision-compass-prompt`（commit c3afc7d）。

如何查看（建议）

- 在 GitHub 上切换到分支：`feat/decision-compass-prompt`，或打开仓库首页顶部的 “Compare & pull request”。
- 本地查看：
  ```powershell
  git fetch origin
  git checkout feat/decision-compass-prompt
  code packages/01-decision-compass-universal/theology-card.md
  ```

如何用 GENMINIE（快速参考）

- 把 `decision-compass-prompt.md` 的内容作为 system prompt；把 `sample_input.json` 的 JSON 作为 user message（或 prompt），发送到 GENMINIE 的 chat/completions 或 completions 接口（参见 `GENMINIE_example.md`）。
- 注意：不要将真实 API key 写入仓库。用环境变量或 CI secret 注入。

下一步建议（你可选）

- 我可以替你在 GitHub 创建 PR 草稿（带上本次变更摘要）。
- 或把 GENMINIE 模板替换为你提供的确切 API 请求字段。

如果你同意，我现在会把这个笔记提交到当前分支并推送到远程。