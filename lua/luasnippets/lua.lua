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
        local t = ls.text_node
        local fmt = require("luasnip.extras.fmt").fmt

        -- 選択されたテキストを取得するヘルパー関数
        local function get_visual(_, parent)
            if (#parent.snippet.env.LS_SELECT_RAW > 0) then
                return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
            else
                return sn(nil, i(1))
            end
        end
        
        return {[]}
    ]], { i(0) }, { delimiters = "[]" })),
    s("snip", fmt([=[
        s("<>", fmt([[
            <>
        ]])),
    ]=], { i(1, ""), i(0) }, { delimiters = "<>" })),
    s({ trig = "(snipregex|sreg)", trigEngine = "vim" }, fmt([=[
        s({ "(<>|)", trigEngine= "vim" }, fmt([[
            <>
        ]]))
    ]=], { i(1, ""), i(0) }, { delimiters = "<>" })),
    s("delim", fmt([[
         delimiters = "{}",{}
    ]],{ i(1, ""), i(0) })),
    s("tm", fmt([[
        $TM_SELECTED_TEXT{}
    ]], { i(0) })),
    s("test", fmt([[
        if {} then
            {}
        end
    ]], { i(1, ""), d(2, get_visual), })),
    s({trig = "test", name="test",}, fmt([[
        if {} then
            {}
        end
    ]], { i(1, ""), d(2, get_visual), })),
}

