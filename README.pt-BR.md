<div align="center">

<img src="assets/brand/logo-banner.svg" alt="Book Genesis" width="720">

### Dez livros em trinta dias. Um pipeline. Qualquer agente de IA.

[![Licença: MIT](https://img.shields.io/badge/Licen%C3%A7a-MIT-D4A574?style=for-the-badge&labelColor=0A0E27)](LICENSE)
[![Agentes](https://img.shields.io/badge/Agentes-Claude%20Code%20·%20Codex%20·%20Antigravity%20·%20Kimi-D4A574?style=for-the-badge&labelColor=0A0E27)](#use-com-qualquer-agente)
[![Pipeline](https://img.shields.io/badge/Pipeline-7%20fases-D4A574?style=for-the-badge&labelColor=0A0E27)](#o-pipeline)
[![Score](https://img.shields.io/badge/Genesis%20Score-10%20dimens%C3%B5es-D4A574?style=for-the-badge&labelColor=0A0E27)](#o-genesis-score)

[**English**](README.md) · [**Português**](README.pt-BR.md)

</div>

---

## O que é

**Book Genesis** é um pipeline de produção de livros com IA, agnóstico de agente. Ele pega uma ideia de uma linha e a leva por pesquisa, esboço, escrita, auditoria adversarial, pontuação e empacotamento editorial — e roda em qualquer lugar onde um agente de IA capaz consiga ler e escrever arquivos.

**Não é** um binário, um serviço ou um prompt único. É uma pasta reproduzível de instruções em markdown, manifestos, regras de pontuação e contratos de arquivo. É por isso que ele migra limpo entre Claude Code, Codex, Antigravity, Kimi e qualquer outro agente que enxergue arquivos.

> **A promessa é simples.** 10+ livros em menos de 30 dias. Um pipeline. Qualquer agente capaz.

---

## Por que esta versão funciona melhor

O sistema antigo V4/V5 tinha muitas skills especializadas e travas no meio do draft. Pegava problemas, mas empurrava o escritor a escrever para o avaliador. O core universal mantém as partes duráveis e remove os pontos de pressão.

| V4/V5 antigo                       | Core Universal                              |
| ---------------------------------- | ------------------------------------------- |
| Muitas restrições simultâneas      | Um prompt de fase ativo por vez             |
| Premissas implícitas               | Arquivo explícito de premissas              |
| Estado em memória                  | Estado de projeto persistido em arquivo     |
| Pontua enquanto escreve            | Escreva primeiro, julgue depois             |
| Pontua antes da auditoria          | Auditoria adversarial antes da nota final   |
| Notas livres                       | Evidência exigida para toda nota            |
| Preso a uma ferramenta             | Portátil pra qualquer agente que lê arquivo |

Os dois pipelines vêm no repo. Use o que servir à sua produção.

---

## O pipeline

O core universal roda um **fluxo de 7 fases**:

```
  ╭──────────────╮      ╭──────────────╮      ╭──────────────╮      ╭──────────────╮
  │  0. INTAKE   │ ───▶ │  1. ALICERCE │ ───▶ │ 2. ARQUITE-  │ ───▶ │  3. ESCRITA  │
  │   briefing + │      │  personagens │      │  outline +   │      │   capítulos  │
  │  mapa de     │      │  curva       │      │   mapa de    │      │   em arquivo │
  │  mercado     │      │  emocional   │      │   tensão     │      │              │
  ╰──────────────╯      ╰──────────────╯      ╰──────────────╯      ╰──────────────╯
                                                                            │
  ╭──────────────╮      ╭──────────────╮      ╭──────────────╮              │
  │ 6. PACOTE    │ ◀─── │  5. NOTA     │ ◀─── │ 4. AUDITORIA │ ◀────────────╯
  │  EDITORIAL   │      │   FINAL      │      │  ADVERSARIAL │
  │  blurb +     │      │              │      │              │
  │  brief capa  │      │              │      │              │
  ╰──────────────╯      ╰──────────────╯      ╰──────────────╯
```

Estrutura padrão do projeto:

```
PROJECT_STATE.yaml
ASSUMPTIONS.md
artifacts/
manuscript/
  └── chapters/
evaluations/
delivery/
```

---

## O Genesis Score

Todo livro é avaliado em **10 dimensões**:

`Originalidade` · `Tema` · `Personagens` · `Prosa` · `Ritmo` · `Emoção` · `Coerência` · `Mercado` · `Voz` · `Abertura`

A aprovação exige:

- Média ponderada forte;
- **Nenhuma dimensão de chão fraca**;
- Evidência citada para cada nota;
- Auditoria adversarial aprovada.

> **O princípio do chão.** Um livro só é tão forte quanto sua dimensão mais fraca. Prosa brilhante não salva uma abertura morta. Um gancho matador não salva ritmo arrastado.

---

## Use com qualquer agente

| Ferramenta    | Como rodar                                                                            | Status                       |
| ------------- | ------------------------------------------------------------------------------------- | ---------------------------- |
| Claude Code   | Instale a pasta de skill completa, depois `/book-genesis-codex`                       | Skill multi-arquivo nativa   |
| Codex         | Aponte o Codex pra `AGENTS.md` ou `skills/book-genesis-codex/SKILL.md`                | Workflow de repo nativo      |
| Antigravity   | Abra o repo e diga ao agente pra seguir `AGENTS.md`                                   | Playbook de agente           |
| Kimi          | Faça upload da pasta de skill ou cole o `AGENTS.md` junto com o manifesto             | Workflow apoiado em arquivo  |
| Outros        | Forneça a pasta `skills/book-genesis-codex/` inteira                                  | Sistema markdown portátil    |

**Exemplo Claude Code:**

```bash
/book-genesis-codex pt-br "thriller sobre um ex-policial que descobre que sua vingança é parte do sistema que ele odeia"
```

**Codex / Antigravity / Kimi:**

> Use Book Genesis. Leia `AGENTS.md`, depois siga `skills/book-genesis-codex/references/pipeline/manifest.yaml` uma fase por vez. Persista decisões em arquivos. Não pule a auditoria adversarial.

---

## Instalação

O instalador copia as pastas de skill completas — incluindo `references/` — para o diretório de skills do Claude Code.

**macOS / Linux**

```bash
./install.sh
```

**Windows PowerShell**

```powershell
.\install.ps1
```

Depois da instalação:

```
/book-genesis-codex
```

Comandos legados continuam funcionando:

- `/book-genesis` — V5 Craft Mode
- `/book-genesis-full` — pipeline V4/V5 completo

---

## Galeria de prova

10 projetos de livro passados pelo sistema em menos de 30 dias. A produção local já passou de 10 manuscritos prontos ou quase prontos no mesmo período. Os manuscritos ficam privados; o repo entrega o pipeline, capas, artefatos públicos e estudos de caso.

| Caso                       | Gênero                                | Nota de pipeline                                                |
| -------------------------- | ------------------------------------- | --------------------------------------------------------------- |
| Protocolo Não Encontrado   | memória / ensaio geracional           | pipeline mais simples; resposta externa forte                   |
| Age of Aquarius            | fantasia hermética                    | Genesis Score interno alto após avaliação iterativa             |
| Protocolo Vermelho         | thriller justiceiro                   | calibração V4→V5 mostrou inflação de nota e limites de ritmo    |
| The Source Code            | sci-fi literário                      | loops longos de revisão revelaram retornos decrescentes         |
| The Source Code v2         | reescrita do anterior                 | scoring com auditoria primeiro provou ser mais seguro           |
| The Trumpet Protocol       | thriller literário apocalíptico       | dimensão customizada de coerência teológico-profética           |
| The Seventh Manuscript     | dark academia / thriller literário    | base pra narrador não-confiável e risco meta-gênero             |
| Iron Core                  | LitRPG / dungeon core                 | restrição metodológica SRE específica de gênero                 |
| The Saltwater Loaf         | cozy mystery                          | sistema de pistas fair-play e restrições do mercado cozy        |
| Agenda 2030                | sci-fi/fantasia apocalíptica          | calibração de fundação RAG em escala                            |

Resumos completos em [`SHOWCASE.md`](SHOWCASE.md), [`docs/book-gallery.md`](docs/book-gallery.md) e [`examples/cases/`](examples/cases/).

---

## Quando usar qual pipeline

**Use o Core Universal quando** estiver começando um livro novo, transitando entre Claude Code / Codex / Antigravity / Kimi, quiser menos restrições durante o draft ou se importar com estado de projeto durável.

**Use V4/V5 legado quando** precisar da rede antiga de skills, quiser controle explícito máximo, estiver reproduzindo casos antigos ou testando uma sub-skill especializada.

---

## Mapa do repositório

```
skills/book-genesis-codex/   core universal atual
skills/                      skills legadas do Claude Code
agents/                      orquestrador autônomo legado
knowledge/                   referências de benchmark e craft
docs/                        arquitetura, migração, scoring, portabilidade
examples/                    artefatos públicos e estudos de caso
assets/covers/               capas e conceitos de capa
```

---

## Portabilidade

Book Genesis foi projetado pra funcionar entre ambientes de agente porque o produto real não é um binário ou um prompt único — é um workflow reproduzível em arquivo.

- `AGENTS.md` diz aos agentes que enxergam repo o que fazer.
- `skills/book-genesis-codex/SKILL.md` explica o loop operacional.
- `references/pipeline/manifest.yaml` define a ordem das fases.
- `references/prompts/` contém os prompts de cada fase.
- `references/scoring/` contém o contrato de pontuação.

Veja [`docs/portability.md`](docs/portability.md) pra instruções de Claude Code, Codex, Antigravity, Kimi e agentes genéricos.

---

## Licença

MIT. Use, faça fork, publique livros. Se um manuscrito sair com a ajuda do Book Genesis, um crédito no colofão é apreciado, nunca exigido.

---

<div align="center">

**Feito pra escritores que querem rodar o loop, não vigiar ele.**

[Ler os docs](docs/) · [Ver os casos](SHOWCASE.md) · [Estrelar no GitHub](https://github.com/felipelobomotta-blip/book-genesis-v4)

</div>
