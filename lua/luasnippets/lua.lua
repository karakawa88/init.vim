local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local t = ls.text_node
local sn = ls.snippet_node
local fmt = require("luasnip.extras.fmt").fmt

-- 選択されたテキストを取得するヘルパー関数
local function get_visual(_, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1))
  end
end

return {
  s("ls_file", fmt([[
    local ls = require("luasnip")
    local s = ls.snippet
    local i = ls.insert_node
    local fmt = require("luasnip.extras.fmt").fmt
    return {<>}
  ]], i(0), { delimiters = "<>" })),
  s("ls_test",{
    t("print("),
    d(1, get_visual),
    t(")") } ),
}


