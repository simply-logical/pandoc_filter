--[[
function Str(el)
  -- Do not escape > or < in {{< and >}}
  if el.text == '>}}' then
    return pandoc.RawInline('markdown', el.text)
  elseif el.text == '{{<' then
    return pandoc.RawInline('markdown', el.text)
  else
    return el
  end
end
]]--

-- Preserve custom markdown syntax
function Code(el)
  if string.match(el.text, "^[(]?{{< ") and string.match(el.text, " >}}[)]?$") then
    return pandoc.RawInline('markdown', el.text)
  else
    return el
  end
end

-- Insert quarto style cross-referencing
function Link(el)
  for attr_key, attr in pairs(el.attributes) do
    if (attr_key == "reference-type" and attr == "ref") then
      local label = el.target:match("^#(.+)$")
      if label then
        return pandoc.RawInline('markdown', '[-@' .. label .. ']')
      else
        print("No section label found for: " .. el.target)
      end
    end
  end
  return el
end
