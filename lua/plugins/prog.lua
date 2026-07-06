-- プログラム関連のプラグイン
return {
{
    'dense-analysis/ale',
    lazy = false,
    init = function()
        -- Configuration goes here.
        local g = vim.g

        -- シンタックスチェック ALE
        -- エラー行に表示するマーク
        g.ale_sign_error = '⨉'
        g.ale_sign_warning = '⚠'
        -- エラー行にカーソルをあわせた際に表示されるメッセージフォーマット
        g.ale_echo_msg_format = '[%linter%] %s [%severity%]'

        -- ファイルを開いたときにlint実行
        g.ale_lint_on_enter = 1
        -- ファイルを保存したときにlint実行
        g.ale_lint_on_save = 1
        -- 編集中のlintはしない
         g.ale_lint_on_text_changed = 'never'

        -- eslint_dを利用するための設定
        -- if vim.fn.executable('eslint_d') then
        --     let g.ale_javascript_eslint_use_global = 1
        --     let g.ale_javascript_eslint_executable = 'eslint'
        -- end
        g.ale_linters_explicit = 1
        -- ESLint \   'javascript'. ['eslint']
        --let g.ale_linters = {
        --\       'javascript'. ['eslint'],
        --\       'tex'. ['chktex'],
        --\       'rust'. ['cargo clippy'],
        --\       'python'. ['flake8'],
        --\       'sh'. ['shellcheck'],
        --\ }
        g.ale_tex_chktex_options = '-n 8'
        --highlight ALEErrorSign ctermbg=NONE ctermfg=red
        --highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
        g.ale_linters = {
            lua = {'lua_language_server'},
            sh = {'shellcheck'}
        }
    end
},
{
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	build = "make install_jsregexp",
    lazy = false,
    config = function ()
        -- require("luasnip.loaders.from_lua").load()
        require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/lua/luasnippets" } })
        local ls = require("luasnip")
        ls.setup({
            store_selection_keys = "<Tab>", -- ビジュアルモードでTabを押すと選択範囲が保存されます
        })
        -- vim.keymap.set({"i", "s"}, "<Tab>", function()
        --         if ls.expand_or_jumpable() then
        --             ls.expand_or_jump()
        --             print("luasnip yes")
        --         else
        --             print("luasnip no")
        --     -- スニペットがない場合は通常のTab入力
        --             vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
        --         end
        -- end, {silent = true})
        --
        -- -- Shift+Tabで前のプレースホルダーへ戻る設定
        -- vim.keymap.set({"i", "s"}, "<S-Tab>", function()
        --     if ls.jumpable(-1) then
        --         ls.jump(-1)
        --     end
        -- end, {silent = true})
        -- vim.keymap.set({"i"}, "<Tab>", function() ls.expand() end, {silent = true})
        -- vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
        -- vim.keymap.set({"i", "s"}, "<C-R>", function() ls.jump(-1) end, {silent = true})
        --
        -- vim.keymap.set({"i", "s"}, "<C-E>", function()
        --     if ls.choice_active() then
        --         ls.change_choice(1)
        --     end
        -- end, {silent = true})
    end,
},
}


