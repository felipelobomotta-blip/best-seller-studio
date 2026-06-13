# BESTSELLER DNA — Knowledge Base do Pipeline

**Data:** 2026-03-13
**Fontes:** The Bestseller Code (Archer & Jockers, ML em 20K+ novels), Reagan et al. (Vermont, 1700+ books), Paul Zak (neurociência), Ben Blatt (Nabokov's Favorite Word Is Mauve), Story Grid (Coyne), Lisa Cron (Wired for Story), Marlowe AI, dados de mercado 2024-2025.
**Validação:** Testado contra 10 bestsellers (90M+ cópias combinadas) + 5 outliers (350M+ cópias) + 6 anteriores (V3). Ver `evaluations/00-comparativo-v32-10-bestsellers.md` e `evaluations/eval-v33-outliers.md`.

### DESCOBERTA CRÍTICA V3.4: O QUE REALMENTE VENDE (Ranked)
1. **Tomorrow Test** — anchors concretos e memoráveis (15/15 bestsellers passam). Inclui IMAGE anchors e QUOTE anchors (Alchemist = quotes, não cenas).
2. **Pacing ≥ 8.0** — #2 predictor. 7.5 prose + 9.0 pacing outsells 9.0 prose + 7.5 pacing by 10x
3. **Casual Reader compra** — se não compra em 3 páginas, craft não salva
4. **Shareability (3 tipos)** — Quote shareability (Alchemist), Plot shareability (Gone Girl), Emotional shareability (It Ends with Us). Livros com os 3 tipos = viral máximo.
5. **Human closeness** — 30%+ do conteúdo (12/15 bestsellers)
6. **Genesis Score floor NÃO prediz vendas** — floor 6.0 vendeu 150M (Fifty Shades) vs floor 8.5 vendeu 6M
7. **Engagement Type importa** — Empatia não é o único motor. 5 tipos: Empatia, Fascinação, Auto-inserção, Estimulação Intelectual, Aspiração/Identidade

### DESCOBERTA CRÍTICA V3.4: LONG-TAIL vs LAUNCH
- CVI-Launch prevê vendas no primeiro ano (Fifty Shades CVI 9.5, vendeu 150M em 5 anos)
- CVI-Legacy prevê vendas em 20 anos (Dune CVI-Launch 7.5, mas 20M+ em 60 anos)
- Livros com alto CVI-Launch + baixo CVI-Legacy = airport bestseller (one-and-done)
- Livros com baixo CVI-Launch + alto CVI-Legacy = cult classic (slow build)

---

## 1. REGRAS ESTRUTURAIS (Data-Driven)

### 1.1 Word Count
| Gênero | Sweet Spot | Range Aceito |
|--------|-----------|--------------|
| Memoir | ~68,000 | 60,000-90,000 |
| Literary Fiction | ~98,000 | 80,000-95,000 (debut) |
| Thriller | ~91,000 | 70,000-100,000 |
| Romance | ~90,000 | 75,000-100,000 |
| Nonfiction geral | varies | 50,000-80,000 |

- Média NYT bestseller: **273 páginas (~68K words)**
- Tendência: livros ficando **42% mais curtos** nos últimos 7 anos

### 1.2 Turning Points Estruturais
- **~25% (~17K words):** Primeiro turning point major
- **~50% (~34K words):** Midpoint — pico ou vale que empurra pro conflito final
- **~75% (~51K words):** All Is Lost / Dark Night of the Soul
- **Save the Cat beats:** verificados em King, Rowling, Christie, Green, Moyes

### 1.3 Arco Emocional — O Formato "W"
- Reagan et al. identificaram **6 arcos básicos** em 1,700+ obras
- Os 3 mais populares: **Icarus** (rise-fall), **Oedipus** (fall-rise-fall), **Man in a Hole** (fall-rise)
- O arco mais correlacionado com bestsellers: **Double Man-in-a-Hole (W)** — fall-rise-fall-rise
- Da Vinci Code e Fifty Shades têm **grafos de sentimento quase idênticos** apesar de gêneros opostos
- **~8 oscilações emocionais regulares** no livro todo formam uma onda sinusoidal

### 1.4 Capítulos
- Média geral: **2,000-4,000 palavras**
- Thrillers (Patterson): **1,000-2,000 palavras** (capítulos curtos = page-turn compulsion)
- Nonfiction: **4,000-6,000 palavras**
- Capítulos curtos com cliffhangers aumentam velocidade de leitura

### 1.5 Cinco Mandamentos (Story Grid — todo nível)
Todo capítulo/cena DEVE conter:
1. **Inciting Incident** — tira a vida do equilíbrio
2. **Progressive Complications** — problemas ESCALAM (não só multiplicam)
3. **Crisis** — dilema real com opções incompatíveis
4. **Climax** — resposta ativa à crise
5. **Resolution** — consequência da escolha

**Value Shift obrigatório:** a situação deve mudar de positivo pra negativo ou vice-versa. Cena sem value shift = cena morta → cortar.

---

## 2. REGRAS DE PROSA (Métricas Mensuráveis)

### 2.1 Readability
| Métrica | Bestseller Range | Referências |
|---------|-----------------|-------------|
| Flesch-Kincaid Grade | **5-7** | Hemingway (4), Rowling (5.7), King (6) |
| Tendência histórica | Caiu de Grade 8 (1960s) pra Grade 7 (hoje) | 97% dos bestsellers abaixo de Grade 7 em 2014 |
| Vocabulário | Simples > complexo | Contrações, substantivos + verbos carregam sentido |

**REGRA: Se a prosa está acima de Grade 7, simplificar.**

### 2.2 Adverbs (Blatt Data)
| Autor | Adverbs por 10K palavras |
|-------|-------------------------|
| Toni Morrison | 76 |
| Hemingway | 80 |
| Bestsellers bons | < 105 |
| E.L. James | 155 |

**REGRA: Target < 105 adverbs por 10K palavras.**

### 2.3 Diálogo
- **25-35% do livro** deve ser diálogo (Marlowe AI / Bestseller Code)
- **"Said" é a tag invisível.** Os melhores usam "said" dominantemente
- Tags criativas ("exclaimed," "hissed") correlacionam com prosa mais fraca
- Abaixo de 25% → denso demais. Acima de 35% → raso

### 2.4 Sensory Detail
- **Visual domina** mas bestsellers usam os 5 sentidos
- **Concreto > abstrato** — bestsellers têm mais detalhes concretos sensoriais
- Metáforas devem ser **específicas e curtas** — não extended/analytical

### 2.5 Abertura
- Agentes decidem em **3-5 páginas**
- Primeira frase: **verbos > adjetivos**
- Inciting incident: **capítulo 1** (comercial) ou **até capítulo 3** (literário)
- Elementos: clareza + curiosity gap = fórmula dos melhores openings

---

## 3. REGRAS EMOCIONAIS (Neurociência + Data)

### 3.1 Neuroquímica do Engajamento
| Hormônio | Trigger | Efeito |
|----------|---------|--------|
| **Cortisol** | Tensão, conflito, perigo | Foco + memória |
| **Oxitocina** | Vulnerabilidade, conexão humana | Empatia + bonding |
| **Dopamina** | Curiosity gaps, surpresa, resolução | Motivação + "keep reading" |

**REGRA CRÍTICA: Vulnerabilidade > Força.** Oxitocina dispara quando personagens mostram fraqueza, dúvida, luta — NÃO quando mostram força/competência.

### 3.2 Tópicos que Vendem (ML em 20K novels)
- **#1 predictor: "human closeness"** — intimidade humana, conversas íntimas
- **30%+ do conteúdo** de bestsellers é sobre proximidade humana
- Tópicos que correlacionam: conexão, trabalho, família, vida doméstica, morte
- Tópicos que ANTI-correlacionam: sexo explícito, drogas, grief desesperado como tópico primário

### 3.3 Micro-Tensão (Donald Maass)
- A tensão vem de **conflito emocional INTERNO**, não de plot
- Cada página precisa de alguma **contradição emocional**, mesmo em cenas quietas
- Memoir sobre depressão = micro-tensão natural (querer viver vs querer desaparecer)

### 3.4 Word-of-Mouth Triggers (Berger)
Emoções que geram compartilhamento:
- ✅ **Awe** (admiração)
- ✅ **Ansiedade** (desconforto produtivo)
- ✅ **Humor desconfortável**
- ❌ **Tristeza pura** (NÃO gera compartilhamento)

**REGRA: Um livro que só faz o leitor sentir pena não será recomendado. Precisa de desconforto + humor ácido + momentos de "puta merda".**

### 3.5 Ritmo Emocional
- Bestsellers têm **~8 oscilações emocionais regulares** no livro todo
- A **regularidade do beat** distingue bestsellers — não o formato do plot
- Speed variation: passagens rápidas (frases curtas, ação) alternadas com lentas (sensorial, reflexão) = "can't put down"

### 3.6 O Fator "Lembrado"
- Concreto > abstrato para recall do leitor
- **Emotional peak + sensory detail** = memória mais forte
- O reader precisa CUIDAR do personagem ANTES do momento emocional
- Cuidado vem de **vulnerabilidade**, não competência

### 3.7 Transportation (Melanie Green)
Fatores que aumentam imersão narrativa:
- Identificação emocional com o personagem
- Vivacidade imagética (detalhes sensoriais concretos)
- Suspense e curiosity gaps
- Neural coupling: cérebros dos leitores **sincronizam literalmente** com o narrador

---

## 4. REGRAS COMERCIAIS (Market Data)

### 4.1 Título
- **85% dos bestsellers:** título com 1-6 sílabas
- Títulos curtos e memoráveis > títulos descritivos
- Teste: pode ser dito em voz alta numa conversa? Pode ser escrito num texto?
- Subtítulo: ajuda em nonfiction (clarifica promessa), opcional em memoir

### 4.2 Cover
- **Thumbnail test:** cover deve funcionar a 120x180px (Amazon)
- Títulos legíveis no thumbnail ganham **70% mais cliques**
- Minimalist trending up. Tipografia bold.

### 4.3 Reviews
- **5 reviews no Amazon = +270% em vendas**
- Target: **100+ reviews no primeiro mês**
- Estratégia ARC readers (200+ leitores antecipados)

### 4.4 Preço
- Ebook memoir/nonfiction: $4.99-$9.99 sweet spot
- Print: $14.99-$18.99

### 4.5 Mercado Memoir
- Crescimento de **54% YoY** (Nov 2024 a Mai 2025)
- Projeção: **15-20% crescimento anual**
- **61% dos leitores de nonfiction** preferem biografias e memórias
- BookTok e book clubs = canais primários de descoberta

### 4.6 Comp Titles
- Queries com comp titles fortes recebem **35% mais pedidos** de agentes
- Comps devem ser: publicados nos últimos 5 anos, mesmo gênero, bem-sucedidos mas não mega-bestsellers

### 4.7 Email/Newsletter
- Autores com **15K+ subscribers** ganham **20X** mais que autores com <100
- Lista de email = ativo mais valioso pra lançamento

### 4.8 Endings
- **Resolução emocional é obrigatória** — mesmo com threads abertos
- Ambiguidade de plot tolerável se arco emocional fecha
- Gestalt: cérebro prefere formas completas → narrative closure reduz carga cognitiva

---

## 5. CHECKLIST DE VALIDAÇÃO (Para o Evaluator)

### Estrutural
- [ ] Word count no sweet spot do gênero
- [ ] Turning points em ~25%, ~50%, ~75%
- [ ] Arco emocional em "W" ou variante com oscilações regulares
- [ ] Toda cena tem value shift (positivo↔negativo)
- [ ] 5 Commandments em cada capítulo
- [ ] Capítulos com tamanho variado (não todos iguais)

### Prosa
- [ ] Flesch-Kincaid ≤ Grade 7
- [ ] Adverbs < 105 por 10K palavras
- [ ] Diálogo entre 25-35% do total
- [ ] "Said" como tag dominante
- [ ] Detalhes sensoriais concretos (não só visuais)
- [ ] Metáforas curtas e específicas (não extended)

### Emocional
- [ ] 30%+ do conteúdo sobre human closeness/intimidade
- [ ] Vulnerabilidade > competência nos primeiros capítulos
- [ ] ~8 oscilações emocionais regulares ao longo do livro
- [ ] Micro-tensão em cada página (contradição emocional interna)
- [ ] Momentos de awe + humor desconfortável (word-of-mouth triggers)
- [ ] Reader cuida do personagem ANTES dos peaks emocionais
- [ ] Cortisol (tensão) + Oxitocina (vulnerabilidade) + Dopamina (curiosity gaps) presentes

### Comercial
- [ ] Título memorável (1-6 sílabas, dizível em conversa)
- [ ] Abertura com curiosity gap nas primeiras 3 frases
- [ ] Ending com resolução emocional
- [ ] 3-4 shareable moments (textáveis pra um amigo)
- [ ] Emotional residue definido (o que fica 10 min depois de fechar)

---

## 6. VERBOS DE BESTSELLER (Bestseller Code ML)

Os 4 verbos mais frequentes em personagens de bestsellers:
1. **need**
2. **want**
3. **miss**
4. **love**

Personagens de bestsellers "need" e "want" **2x mais** que personagens de livros médios. Personagens que desejam, precisam, sentem falta e amam = personagens que vendem.

---

## FONTES PRIMÁRIAS

- Archer, J. & Jockers, M.L. (2016). *The Bestseller Code*. St. Martin's Press.
- Reagan, A. et al. (2016). "The emotional arcs of stories." *EPJ Data Science*.
- Blatt, B. (2017). *Nabokov's Favorite Word Is Mauve*. Simon & Schuster.
- Coyne, S. (2015). *The Story Grid*. Black Irish Entertainment.
- Cron, L. (2012). *Wired for Story*. Ten Speed Press.
- Zak, P. (2015). "Why Inspiring Stories Make Us React." *Cerebrum* / PNAS.
- Maass, D. (2009). *The Fire in Fiction*. Writer's Digest.
- Green, M. & Brock, T. (2000). "The Role of Transportation in Persuasiveness of Public Narratives." *JPSP*.
- Berger, J. (2013). *Contagious: Why Things Catch On*. Simon & Schuster.
- Swain, D. (1981). *Techniques of the Selling Writer*. Univ. Oklahoma.
- Brody, J. (2018). *Save the Cat! Writes a Novel*. Ten Speed Press.
