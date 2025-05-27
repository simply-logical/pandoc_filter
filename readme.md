# Custom Pandoc Filters

Custom pandoc filters for converting LaTeX to quarto markdown.

## Usage

To see the pandoc abstract syntax tree (AST):

```bash
pandoc test.tex -f latex+raw_tex -t native -o test.txt
```

---

To convert, first inject
```latex
\input{filter_markdown}
```
**just above** `\begin{document}` into the LaTeX file. Then, execute
```bash
pandoc test.tex -f latex+latex_macros -t markdown --lua-filter=filter_markdown.lua --wrap=preserve -o test.md
```

You can convert multiple files (do not specify the `.tex` extension) like so
```bash
batch=(
    file1
    file2
    file3
    ...
)
for item in "${batch[@]}"; do
    pandoc "${item}.tex" -f latex+latex_macros -t markdown --lua-filter=filter_markdown.lua --wrap=preserve -o "${item}.qmd"
done
```

## Filters List

### `filter_latex.lua`

Replaces LaTeX `\customidx{param}` with markdown `{{< indexer add param >}}`.

### `filter_markdown.lua`

Replaces `mlind` and `mldef` LaTeX commands with the corresponding markdown syntax.

## Build commands

### Render the whole project

From the root directory of the repository render to LaTeX:
```bash
quarto render --to=latex
```

### Render a specific file

From the root directory of the repository render to LaTeX:
```bash
quarto render ./file.qmd --log-level=info --to=html
```

### Preview

Open the file:
```bash
open _book/file.html
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
