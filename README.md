# Fluxograma · Rastreamento do Câncer do Colo do Útero (Parte II)

[![Netlify Status](https://api.netlify.com/api/v1/badges/590bae44-ecf0-4bcf-a1ea-8b032058c0a0/deploy-status)](https://app.netlify.com/projects/colo-utero-fluxo/deploys)

Ferramenta de consulta rápida às recomendações das **Diretrizes Brasileiras para o
Rastreamento do Câncer do Colo do Útero, Parte II**, publicadas pela Conitec, pelo
INCA e pelo Ministério da Saúde.

Publicado em <https://colo-utero-fluxo.netlify.app/>

---

## ⚠️ Versão preliminar

O documento de origem é uma **versão preliminar em consulta pública** e pode sofrer
alteração. Este material resume e transcreve as recomendações, mas **não substitui a
leitura do texto integral nem o julgamento clínico**.

---

## Para que serve

O documento de origem tem 175 páginas e 18 fluxogramas espalhados por 7 capítulos.
A conduta depende de cinco variáveis ao mesmo tempo: população, impressão
colposcópica, genótipo do HPV, citologia reflexa e tipo de zona de transformação.
Um único diagrama não daria conta disso.

A ferramenta oferece dois caminhos:

- **Navegador de conduta.** Cinco campos, e a conduta correspondente aparece com o
  número da recomendação de origem.
- **Fluxos por capítulo.** Capítulos 1 a 6 em cartões de passos e tabelas de
  ramificação, para consultar ou imprimir por inteiro.

Cada conduta traz o número da recomendação. Clicar nele abre a **transcrição literal**
daquela recomendação, com força e nível de certeza. A última aba reúne a transcrição
de todas as recomendações citadas, em ordem, o que também serve para busca com Ctrl+F.

---

## Fonte e direitos

> BRASIL. Ministério da Saúde. Comissão Nacional de Incorporação de Tecnologias no SUS
> (Conitec). Instituto Nacional de Câncer (INCA). *Diretrizes Brasileiras para o
> Rastreamento do Câncer do Colo do Útero: Parte II — Como avaliar, tratar e seguir
> mulheres identificadas no rastreamento do câncer de colo do útero.* Relatório de
> Recomendação. Brasília, DF, julho de 2026. Versão preliminar sujeita a consulta pública.

A transcrição literal das recomendações é feita com base na autorização expressa
na página de créditos do próprio documento:

> É permitida a reprodução parcial ou total desta obra, desde que citada a fonte
> e que não seja para venda ou qualquer fim comercial.

Este projeto **não tem fim comercial** e cita a fonte em todas as telas onde
aparece texto transcrito. O PDF de origem está em [`fonte/`](fonte/).

---

## Estrutura do repositório

```
.
├── index.html          # arquivo publicado (gerado — não editar à mão)
├── build.sh            # roda o pipeline inteiro
├── build/
│   ├── base.html       # lógica clínica e layout (fonte editável)
│   ├── extrair.py      # PDF → recomendacoes.json
│   ├── montar.py       # base.html + JSON → index.html
│   └── prerender.js    # gera o HTML estático para funcionar sem JavaScript
└── fonte/
    └── diretrizes-colo-utero-parte-II.pdf
```

O `index.html` é **gerado**. Para mudar o conteúdo clínico, edite `build/base.html`
e rode o build de novo.

---

## Como reconstruir

Pré-requisitos: `python3`, `node` e `pdftotext`.

```bash
# macOS
brew install poppler node

# Ubuntu / Debian
sudo apt install poppler-utils nodejs
```

Depois:

```bash
./build.sh
```

Ou passo a passo:

```bash
python3 build/extrair.py    # lê o PDF em fonte/ e grava build/recomendacoes.json
python3 build/montar.py     # monta o index.html na raiz
```

### Quando sair a versão final da diretriz

1. Substitua o PDF em `fonte/` pelo novo.
2. Rode `./build.sh`.
3. Confira no navegador: abra `index.html`, teste o navegador de conduta e clique
   em alguns números de recomendação para ver se o texto bate com o PDF novo.
4. Revise `build/base.html`, porque as **condutas** podem ter mudado, não só o texto.
   O build atualiza as transcrições automaticamente, mas a lógica clínica é escrita
   à mão e precisa de conferência humana.
5. Atualize o aviso de "versão preliminar" no cabeçalho, se ela deixar de ser preliminar.

O `extrair.py` traz duas tabelas de correção que podem precisar de ajuste se a
diagramação mudar: `NOTAS`, que desfaz marcadores de nota de rodapé colados nas
palavras, e `ERRATA`, que corrige erros de numeração do próprio documento.

---

## Publicação

O site é servido pelo Netlify a partir da branch principal deste repositório.
Qualquer push que altere o `index.html` dispara um novo deploy automaticamente.

Configuração no Netlify:

- **Build command:** vazio
- **Publish directory:** raiz do repositório
