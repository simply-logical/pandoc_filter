# Custom Pandoc Filters

Custom pandoc filters for converting LaTeX to quarto markdown.

## Usage

To convert:

```bash
pandoc -f latex+raw_tex -t markdown --lua-filter=filter.lua test.tex -o test.md
```

To see the pandoc abstract syntax tree (AST):

```bash
pandoc -f latex+raw_tex -t native test.tex -o test.txt
```

## Filters List

### `filter_latex.lua`

Replaces LaTeX `\customidx{param}` with markdown `{{< indexer add param >}}`.

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
