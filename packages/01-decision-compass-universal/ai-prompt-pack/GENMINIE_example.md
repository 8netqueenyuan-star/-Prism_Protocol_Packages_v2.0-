GENMINIE 使用示例（占位模板）

说明：下面示例为通用 HTTP POST 模板，使用占位符 `GENMINIE_API_ENDPOINT` 和 `YOUR_API_KEY`。请根据你们的 GENMINIE 文档替换请求字段（例如 `model`、`messages`、`prompt` 等）。

示例（填入 `decision-compass-prompt.md` 的内容到 system/message）：

```bash
curl -X POST "https://GENMINIE_API_ENDPOINT/v1/chat/completions" \
  -H "Authorization: Bearer YOUR_API_KEY" \
  -H "Content-Type: application/json" \
  -d '{
    "model": "genminie-chat-1",
    "messages": [
      {"role":"system","content":"<PUT CONTENT OF decision-compass-prompt.md HERE>"},
      {"role":"user","content": "<PUT CONTENT OF sample_input.json HERE>"}
    ],
    "max_tokens": 800,
    "temperature": 0.2
  }'
```

调试提示：

- 如果 GENMINIE 使用 `prompt` 而非 `messages`，请把 system+user 内容合并到单一 `prompt` 字段；
- 若返回不是纯 JSON，建议使用 `response_format` 或 `output_format` 参数（若支持），或在 prompt 中再三强调“Output JSON only”。

如果你把 GENMINIE 的 API 文档或示例链接发给我，我可以把上面的模板精确填成 GENMINIE 的格式。