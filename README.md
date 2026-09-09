# Research Website Demand

[中文](#中文) | [English](#english)

## 中文

`research-website-demand` 是一套面向 Codex 的网站与产品真实用户需求研究 Skill。

当你提供一个网站或产品链接，并希望了解真实用户是谁、他们在什么场景下遇到什么问题、为什么愿意付费、正在使用哪些替代方案，以及市场中还存在哪些机会时，它会以公开、可核验的证据为基础开展研究，并输出结构化报告。

### 核心能力

- 从公开网页、社区讨论、评价与官方资料中发现并核验用户需求证据。
- 区分产品方主张、真实用户反馈、推断与未知，避免把营销文案当成用户事实。
- 分析用户群体、使用场景、痛点、替代方案、付费条件与未满足需求。
- 研究目标产品和已发现解决方案的定位、营销链路、功能覆盖与机会缺口。
- 按固定结构交付完整证据清单、证据驱动的用户群体故事，以及 14 个关键问题的回答。

### 使用边界

- 只使用合法公开可访问的信息；不登录、不绕过付费墙或验证码，也不控制浏览器。
- 证据不足时明确保留未知，不编造用户、访谈、需求或市场结论。
- 默认以简体中文输出，保留原始来源链接，方便复核。

### 安装

本仓库本身就是一个完整的 Codex Skill（`SKILL.md` 位于仓库根目录）。安装即把技能内容放入 Codex 的 skills 目录，Codex 会自动发现 `$CODEX_HOME/skills/<技能名>/SKILL.md`（`CODEX_HOME` 未设置时默认 `~/.codex`）。

推荐方式（仓库自带安装脚本）：

```bash
git clone https://github.com/cxf37905-max/research-website-demand.git
cd research-website-demand
./install.sh
```

脚本默认安装到全局 `~/.codex/skills/research-website-demand/`，且只复制技能内容（`SKILL.md`、`agents/`、`references/`），不会夹带 README、`.git`、`install.sh` 等仓库文件。

其它方式：

- 项目级安装（只对当前项目生效）：`./install.sh --dest <项目>/.codex/skills`
- 覆盖已有安装：`./install.sh --force`
- 手动安装：

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/cxf37905-max/research-website-demand.git ~/.codex/skills/research-website-demand
rm -rf ~/.codex/skills/research-website-demand/.git
```

- 用 Codex 官方安装脚本（会一并复制 README 等仓库文件到技能目录）：

```bash
python3 "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo cxf37905-max/research-website-demand --path . --name research-website-demand
```

安装校验：

```bash
test -f ~/.codex/skills/research-website-demand/SKILL.md && echo "已安装"
```

安装完成后，在下一轮对话中用 `$research-website-demand` 即可触发。

卸载：

```bash
rm -rf ~/.codex/skills/research-website-demand
```

### 适用提问示例

```text
使用 $research-website-demand 研究 https://example.com。
我想了解它的真实用户、典型使用场景、未满足痛点、竞品与产品机会。
请只使用公开可核验的证据，并以简体中文输出完整报告。
```

## English

`research-website-demand` is a Codex skill for evidence-based customer, demand, and product-opportunity research on a website or product.

Give it a website or product URL when you need to understand who the real users are, the situations and problems they face, why they may pay, the alternatives they use, and the opportunities that remain underserved. It builds a structured report from public, verifiable evidence.

### What it does

- Finds and validates demand evidence from public webpages, community discussions, reviews, and official materials.
- Separates product claims, real user feedback, research inferences, and unknowns.
- Analyzes customer groups, use cases, pain points, alternatives, willingness to pay, and unmet needs.
- Examines the target product and discovered solutions for positioning, marketing journeys, coverage of user pain points, and opportunity gaps.
- Delivers a complete evidence inventory, evidence-driven user-group narratives, and answers to 14 core research questions.

### Boundaries

- Uses only lawfully accessible public information; it does not log in, bypass paywalls or CAPTCHAs, or control a browser.
- States uncertainty when evidence is insufficient rather than inventing users, interviews, demand, or market conclusions.
- Produces Simplified Chinese by default and includes source links for review.

### Installation

This repository is itself a complete Codex skill (`SKILL.md` sits at the repo root). Installing it means placing the skill contents into Codex's skills directory, where Codex auto-discovers `$CODEX_HOME/skills/<skill-name>/SKILL.md` (`CODEX_HOME` defaults to `~/.codex` when unset).

Recommended (bundled install script):

```bash
git clone https://github.com/cxf37905-max/research-website-demand.git
cd research-website-demand
./install.sh
```

The script installs to the global `~/.codex/skills/research-website-demand/` by default and copies only the skill contents (`SKILL.md`, `agents/`, `references/`), leaving repo-only files such as `README.md`, `.git`, and `install.sh` behind.

Other options:

- Project-local install: `./install.sh --dest <project>/.codex/skills`
- Overwrite an existing install: `./install.sh --force`
- Manual install:

```bash
mkdir -p ~/.codex/skills
git clone https://github.com/cxf37905-max/research-website-demand.git ~/.codex/skills/research-website-demand
rm -rf ~/.codex/skills/research-website-demand/.git
```

- Using Codex's official installer (copies repo files such as README into the skill dir too):

```bash
python3 "$CODEX_HOME/skills/.system/skill-installer/scripts/install-skill-from-github.py" \
  --repo cxf37905-max/research-website-demand --path . --name research-website-demand
```

Verify the install:

```bash
test -f ~/.codex/skills/research-website-demand/SKILL.md && echo "installed"
```

After installing, trigger it on your next turn with `$research-website-demand`.

Uninstall:

```bash
rm -rf ~/.codex/skills/research-website-demand
```

### Example prompt

```text
Use $research-website-demand to research https://example.com.
I want to understand its real users, core use cases, unmet pain points, alternatives, and product opportunities.
Use only public, verifiable evidence and deliver the complete report in Simplified Chinese.
```
