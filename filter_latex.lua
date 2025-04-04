-- Match \customidx{...} and extract the argument
function replace_customidx(text)
  return text:gsub('\\customidx%s*{(.-)}', '{{< indexer add %1 >}}')  -- %s*%b
end

function RawBlock(el)
  if el.format == 'latex' then
    local modified = replace_customidx(el.text)
    return pandoc.RawBlock('markdown', modified)
  end
end

function RawInline(el)
  if el.format == 'latex' then
    local modified = replace_customidx(el.text)
    return pandoc.RawInline('markdown', modified)
  end
end

-- Print AST
function Pandoc(doc)
  print(doc)
  return doc
end
