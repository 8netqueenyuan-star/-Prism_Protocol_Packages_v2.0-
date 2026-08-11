---
# Theology Card — 决策罗盘

Version: v0.1
Status: Core Definition
Layer: Theology / Definition Authority

---

## 1. 产品解决的属灵问题

Decision Compass 不只是解决“我该选 A 还是 B”。它处理更深的问题：

当人的欲望、恐惧、野心、责任与“呼召”的感受混在一起时，如何辨识自己真正是在回应什么？

产品核心目标（一句话）：

> Decision Compass 帮助人区分：我正在回应托付，还是正在追逐我非常想要的东西。

---

## 2. 核心神学定义（Definition Authority）

以下为 Prism Core 定义，属核心权锚点，不可由 Partner 或客户修改：

### 2.1 托付（Calling / Stewardship）

托付并非“我很想做的事情”。托付意味着：

> 某种责任、资源、关系或使命被交到一个人手中，要求以忠心而非自我为中心的方式回应。

特征：指向责任、要求忠心、允许代价与等待，不以即时成功为衡量。

### 2.2 欲望（Desire）

欲望本身非罪；问题在于欲望是否开始取代托付，或以“神的旨意”为掩饰。

关注点：不是“有没有欲望”，而是“欲望在服从托付，还是在篡夺托付的位子？”

---

## 3. 人为何易混淆托付与欲望

二者在外在行为上可能完全相同（例如创业的动机可来自使命、创造欲、追求财富或逃避现实）。因此判定不从“做了什么”开始，而从“是什么在推动你”开始。

---

## 4. 不辨识的代价

- 把野心神圣化；
- 把恐惧伪装成谨慎；
- 把社会期待误认为呼召；
- 把成功误认为忠心；
- 把控制欲包装成信心。

---

## 5. 核心原则

1. AI 不替人判断神的旨意：AI 仅整理信息、显影动机、识别张力与提出问题；属灵判断仍由人负责。
2. 显影优先于结论：先帮助用户看见为什么认为是托付，而非直接给出结论。
3. 托付不等于舒适：困难或牺牲并非托付的反证或佐证。
4. 欲望不是敌人：目标在于整合欲望，或识别其正在篡夺托付的位置。

---

## 6. 产品边界（何时不要用）

- 不是先知式预测或“神旨意生成器”；
- 不是心理诊断或法律/财务替代品；
- 不用于急性危机需要即时人工干预的场景；
- 用户拒绝承担任何个人责任时不适用。

---

## 7. 为 Partner 与 AI 复现而准备：可复制说明

目标：一个客户能看懂；一个 Partner 能复制；一个 AI 能执行 Prompt。

### Partner 可做的修改

- 行业语言与案例；
- 输入/输出的 UI 字段；
- 交付方式与工作流。

不可修改：本文件“核心神学定义”部分（Section 2）。

### 复现步骤（最小可复现单元）

1. 将本文件放在包根路径下：`packages/01-decision-compass-universal/theology-card.md`（已存在）；
2. 在 `ai-prompt-pack/` 中新增或更新 Prompt 文件，引用下面的 `Prompt 模板`；
3. 提供示例输入 JSON（见下）；
4. 在 Partner 的运行环境中调用 AI（ChatGPT 或本地 LLM），传入 Prompt + 示例输入，检视输出并根据需要调整 `follow-up questions`。

---

## 8. Prompt 模板（供 AI 运行）

说明：这个模板旨在让任何 LLM 在接收到用户情境后，产出结构化的“托付显影报告”。

Prompt:

"You are a pastoral discernment assistant. Given the user's situation, identify motivating forces, assess likelihood that this is a `Calling/Stewardship`, surface tensions, and propose minimum viable next actions. Be transparent about uncertainty and avoid definitive statements about divine will. Output JSON only following the provided schema."

输入（示例 JSON schema）:

{
	"situation": "用户简述当前情境和待决问题（1-3 段）",
	"actions_taken": "已做过的主要行动或尝试（可空）",
	"options": ["可选项 A", "可选项 B"],
	"motivations": ["我想要...","我害怕..."],
	"constraints": "现实约束（时间、金钱、家庭等）"
}

输出（JSON schema — 强制）:

{
	"analysis": "对情境的逐条分析（字符串）",
	"calling_likelihood": 0-100,    
	"drivers": [{"label":"desire|stewardship|fear|social","evidence":"支持该判断的证据"}],
	"tensions": ["主要张力 1","主要张力 2"],
	"recommended_next_steps": [{"step":"具体可执行的小动作","why":"原因","timeframe":"预计耗时"}],
	"confidence_explanation": "模型不确定性的来源说明"
}

注意事项：

- 输出必须为纯 JSON，便于系统自动解析；
- 在恰当处加入引导性的后续问题（Follow-up questions），以便让用户进一步澄清动机；
- 明确标注不确定性并避免替用户下属灵结论。

---

## 9. 示例（简短示例输入→输出）

示例输入：

{
	"situation": "我在考虑是否辞掉公司去创业，已经有一个想法和部分存款。",
	"actions_taken": "与家人讨论但尚未决定",
	"options": ["继续上班","辞职创业"],
	"motivations": ["渴望自由","害怕失败","想完成神交给的使命感"],
	"constraints": "家庭经济负担，需要 12 个月储备"
}

示例输出（摘要）：

{
	"analysis": "动机混合：同时存在使命感与对自由/成功的渴望。证据指向动机尚未纯化。",
	"calling_likelihood": 35,
	"drivers": [{"label":"desire","evidence":"表达了对自由与成功的强烈渴望"},{"label":"stewardship","evidence":"提到使命感，但缺少外在托付证据"}],
	"tensions": ["家庭经济 vs 创业时间投入","个人愿景 vs 现有责任"],
	"recommended_next_steps": [{"step":"设计 90 天试验（兼职验证市场）","why":"降低经济风险并检验使命感的持续性","timeframe":"90 days"}],
	"confidence_explanation": "基于用户陈述，缺少外部托付或他证验证，故置信度中等偏低"
}

---

## 10. Definition Authority（重申）

以下段落为不允许被 Partner 或客户修改的核心定义：

- `托付（Calling / Stewardship）` 的定义；
- `欲望（Desire）` 的定义；
- AI 不替属灵判断的原则；
- 显影优先于结论等核心原则。

---

## 11. 变更记录

- v0.1 — 初始核心定义与 Prompt 模板（2026-08-11）

---

