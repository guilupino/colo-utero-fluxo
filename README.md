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
aparece texto transcrito. O PDF de origem não está neste repositório: baixe a versão
vigente no site da Conitec.

---

## Estrutura do repositório

```
.
└── index.html    # página completa: HTML pré-renderizado, CSS, dados e JavaScript
```

O `index.html` é autossuficiente. Ele traz três camadas num arquivo só:

- **HTML pré-renderizado** dentro de `<div id="raiz">`, para a página abrir com
  conteúdo mesmo sem JavaScript.
- **Transcrições das recomendações** no objeto `TEXTOS`, no início do `<script>`.
  Cada chave é o número da recomendação (por exemplo `"5.2.1"`), com o texto em
  `t` e a força e o nível de certeza em `f`.
- **Lógica do navegador de conduta e das abas**, no restante do `<script>`.

> A primeira versão foi gerada por um pipeline (scripts em Python que liam o PDF e
> montavam este arquivo). Esses scripts não foram preservados, então hoje o
> `index.html` é a fonte oficial do projeto.

---

## Como editar

Correções pequenas, como um erro de digitação ou o texto de uma recomendação, podem
ser feitas direto no `index.html`. Nesse caso, altere o mesmo trecho em dois lugares:
no objeto `TEXTOS` e no HTML pré-renderizado, para as duas versões continuarem iguais.
Depois abra o arquivo no navegador e confira.

### Quando sair a versão final da diretriz

A versão final pode mudar condutas, e não só textos. Por isso vale refazer o
pipeline em vez de editar à mão:

1. Baixe o PDF da versão final no site da Conitec.
2. Recrie os scripts de extração usando este `index.html` como modelo de layout e
   lógica. As transcrições passam a vir do PDF novo.
3. Revise a lógica clínica do navegador de conduta à mão. As transcrições podem ser
   automatizadas, mas as condutas precisam de conferência humana.
4. Teste o navegador de conduta e clique em alguns números de recomendação para ver
   se o texto bate com o PDF novo.
5. Atualize ou remova o aviso de "versão preliminar" no cabeçalho.
6. Desta vez, salve os scripts e o PDF no repositório, nas pastas `build/` e `fonte/`.

---

## Publicação

O site é servido pelo Netlify a partir da branch principal deste repositório.
Qualquer push que altere o `index.html` dispara um novo deploy automaticamente.

Configuração no Netlify:

- **Build command:** vazio
- **Publish directory:** raiz do repositório
