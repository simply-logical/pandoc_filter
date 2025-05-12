# Custom Pandoc Filters

Custom pandoc filters for converting LaTeX to quarto markdown.

## Usage

To convert:

```bash
pandoc test.tex -f latex+latex_macros -t markdown --lua-filter=filter_markdown.lua --wrap=preserve -o test.md
```

To see the pandoc abstract syntax tree (AST):

```bash
pandoc test.tex -f latex+raw_tex -t native -o test.txt
```

## Filters List

### `filter_latex.lua`

Replaces LaTeX `\customidx{param}` with markdown `{{< indexer add param >}}`.

### `filter_markdown.lua`

Replaces `mlind` and `mldef` LaTeX commands with the corresponding markdown syntax.

IMPORTANT: The following code needs to be injected into the LaTeX file preamble for the filter to work:
```latex
\input{filter_markdown.tex}
```

## Resources

### API

- <https://pandoc.org/using-the-pandoc-api.html>

### Readers and Writers

- <https://pandoc.org/chunkedhtml-demo/15-custom-readers-and-writers.html>
- <https://pandoc.org/chunkedhtml-demo/7-extensions.html#extensions>
- <https://pandoc.org/MANUAL.html#markdown-variants>

- <https://www.reddit.com/r/pandoc/comments/10yvrgg/getting_into_custom_writers/>

### Filters

- <https://pandoc.org/filters.html>
- <https://pandoc.org/lua-filters.html>

- <https://github.com/pandoc/lua-filters>
