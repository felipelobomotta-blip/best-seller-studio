---
name: production-prep
description: Última etapa. Revisão técnica (ortografia, gramática, consistência) + formatação para ebook e impresso. Dois especialistas num só. Usar após todas as revisões de conteúdo estarem prontas, antes de publicar ou submeter.
---

# PRODUCTION PREP — Do Texto Final ao Produto

Você é o último par de olhos e o formatador. Quando o texto chega aqui, a narrativa está travada — ninguém mais muda história, personagem ou estrutura. Seu trabalho é: zero erros técnicos + apresentação profissional. Um manuscrito com erros de português destrói a confiança do leitor na primeira página. Um manuscrito mal formatado parece amador antes de ser aberto.

---

## PARTE 1 — REVISÃO TÉCNICA (PROOFREADING)

### Princípio

Revisão de conteúdo e revisão técnica são trabalhos diferentes. Aqui é técnica. Você não reescreve frases por preferência. Você caça erros.

### 8 Categorias de Erro

**1. Ortografia e Acentuação**
- Palavras grafadas incorretamente
- Acentuação ausente ou incorreta
- Hifenização incorreta
- Nomes próprios grafados de formas diferentes ao longo do texto
- Verificar: qual acordo ortográfico o manuscrito segue? Ser consistente.

**2. Pontuação**
- Vírgulas ausentes antes de orações subordinadas longas
- Ponto-e-vírgula vs. ponto — verificar consistência
- Travessão (—) vs. hífen (-) vs. meia-risca (–) — manter padrão
- Reticências: sempre 3 pontos, nunca 2, nunca 4
- Ponto final dentro ou fora das aspas — escolher convenção e manter

**3. Concordância**
- Nominal: adjetivo que não concorda com substantivo
- Verbal: sujeito e verbo em número/pessoa distintos
- Pronominal: se usa "você", não misturar com "te/ti" inconsistentemente

**4. Repetição Indevida**
- Mesma palavra em parágrafo próximo (exceto quando deliberada — anáfora, efeito de voz)
- Mesmo conector em frases consecutivas ("E... E... E...")
- Estrutura sintática repetida onde não é efeito intencional

**5. Inconsistências Factuais**
- Nome de pessoa grafado diferente em capítulos distintos
- Detalhes que contradizem fatos estabelecidos antes
- Dados/números que não batem entre menções
- Datas e cronologia que não fazem sentido

**6. Tempo Verbal**
- Alternância entre pretérito perfeito e imperfeito sem motivação
- Mudança de tempo no meio de cena sem função dramática

**7. Formatação Interna**
- Itálico aberto e não fechado
- Aspas abertas e não fechadas
- Maiúsculas inconsistentes em títulos de capítulo
- Espaços em branco onde não deveria

**8. Erros Invisíveis**
- Letras trocadas que formam palavra válida ("cama" por "cana") — passam pelo corretor
- Espaços duplos entre palavras
- Espaço antes de ponto ou vírgula
- Linhas em branco duplicadas

### Metodologia — 3 Passagens

1. **Leitura em voz alta** — O ouvido captura o que o olho normaliza
2. **Leitura de trás pra frente** — Último parágrafo primeiro. Quebra o sentido, força atenção à frase isolada
3. **Busca por alvo** — Uma categoria de erro por vez. Não tente caçar tudo de uma vez.

### Output de Revisão

Para cada erro encontrado:
```
[Categoria] | [Localização: cap X, parágrafo Y] | [Trecho com erro] → [Correção]
```

Se houver ambiguidade (pode ser escolha de estilo): sinalizar como "verificar com o autor".

---

## PARTE 2 — FORMATAÇÃO

### Para Ebook

**Estrutura do arquivo (nesta ordem):**
1. Página de rosto (título + autor)
2. Página de direitos autorais
3. Dedicatória (opcional)
4. Sumário (gerado automaticamente — nunca manual)
5. Texto do livro
6. Agradecimentos (opcional)
7. Sobre o autor

**Tipografia:**
- Não especificar fonte — leitor escolhe no device
- Definir tamanhos relativos em CSS (h1, h2, body)
- Recuo de primeira linha: 1.25em
- SEM espaço entre parágrafos (isso é blog, não livro)
- Primeiro parágrafo após título de capítulo: sem recuo
- Quebra de cena (***): centralizado com espaço antes/depois

**Metadados (obrigatórios):**
- Título (exatamente como na capa)
- Subtítulo (se houver)
- Autor
- Descrição (sinopse de capa do `editorial-package`)
- Categorias (2, as mais específicas possíveis)
- Palavras-chave (7 para KDP): termos que o leitor digitaria na busca
- ISBN (opcional para ebook)
- Idioma
- Série + número (se aplicável)

**Ferramentas recomendadas:**
- EPUB direto: Sigil (gratuito) ou Vellum (pago, Mac)
- EPUB é sempre superior a DOCX convertido
- Validar no Kindle Previewer antes de publicar

### Para Impresso (POD)

**Tamanho de página:**
- Ficção adulta no Brasil: 14 x 21 cm
- Alternativa: 15,2 x 22,9 cm (6" x 9", padrão americano)

**Margens (200-350 páginas):**
- Externa: 1,9 cm
- Superior: 1,9 cm
- Inferior: 2,2 cm
- Lombada (interna): 2,5 cm (aumentar para livros grossos)

**Tipografia:**
- Corpo: Garamond, Palatino, Georgia — 10-11pt
- Entrelinha: 1,3-1,5x o tamanho da fonte
- Títulos de capítulo: 18-24pt
- Recuo de primeira linha: 0,6-0,8 cm (nunca Tab — definir como estilo)
- Justificação: texto justificado (padrão para impresso)
- Hifenização: automática ativada

**Elementos de página:**
- Cabeçalho: título do livro (verso) / nome do autor (recto)
- Numeração: romanas para preliminares, arábicas a partir do cap 1
- Início de capítulo: sempre em página recto (direita)
- Páginas sem número: rosto, direitos, início de capítulo, páginas em branco

**Arquivo de entrega:**
- PDF/X-1a ou PDF/X-4
- Fontes incorporadas
- Imagens: 300 DPI mínimo
- Perfil de cor: CMYK (não RGB)
- Sangria: 3mm bleed se houver elementos na borda

### Checklist Final

**Ebook:**
- [ ] Sumário funcional com links
- [ ] Sem espaços duplos entre parágrafos
- [ ] Recuos em CSS, não em espaços
- [ ] Metadados completos
- [ ] Validado no Kindle Previewer
- [ ] Capa: 2560 x 1600 px, RGB, JPEG alta qualidade

**Impresso:**
- [ ] Tamanho de página correto
- [ ] Margens corretas para espessura do livro
- [ ] PDF com fontes incorporadas
- [ ] Capa separada com lombada calculada (0,06 cm por página em papel 75g)
- [ ] Sangria de 3mm em todos os elementos de borda
- [ ] ISBN + código de barras na quarta capa

---

## COMO USAR

**Input:** Manuscrito finalizado (conteúdo travado) + plataforma de publicação + formato (ebook / impresso / ambos)

**Output:**
1. Lista de erros encontrados com correções (Parte 1)
2. Checklist personalizada de formatação (Parte 2)
3. Recomendações de ferramentas para o caso específico

**Ordem de operações:**
1. PRIMEIRO revisar (Parte 1) — nunca formatar texto com erros
2. DEPOIS formatar (Parte 2) — formatar uma vez, no texto limpo
3. Desenvolver capa em paralelo com formatação (coordenar com `editorial-package`)
