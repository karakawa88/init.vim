return {
{
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  ---@module "fzf-lua"
  ---@type fzf-lua.Config|{}
  ---@diagnostic disable: missing-fields
  config = function()
vim.cmd [[
highlight FzfLuaNormal guibg=#383850
highlight FzfLuaBorder guibg=#383850
]]

vim.opt.winblend = 5
vim.opt.termguicolors = true

vim.keymap.set('n', '<leader>f', "<cmd>lua require('fzf-lua').files()<CR>")
-- vim.keymap.set('n', '<leader>g', "<cmd>lua require('fzf-lua').git_status()<CR>")
-- vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').git_branches()<CR>")
vim.keymap.set('n', '<leader>g', "<cmd>lua require('fzf-lua').grep()<CR>")
vim.keymap.set('n', '<leader>l', "<cmd>lua require('fzf-lua').blines()<CR>")
vim.keymap.set('n', '<leader>t', "<cmd>lua require('fzf-lua').tabs()<CR>")
vim.keymap.set('n', '<leader>b', "<cmd>lua require('fzf-lua').buffers()<CR>")
vim.keymap.set('n', '<leader>o', "<cmd>lua require('fzf-lua').oldfiles()<CR>")
vim.keymap.set('n', '<leader>c', "<cmd>lua require('fzf-lua').commands()<CR>")

--fzf.vimのように:Files <dir>でファイルを選択したい。
vim.api.nvim_create_user_command(
        "Files",
    function(opts)
        -- 実行したいLuaコード
        local fzf = require("fzf-lua")
        local dir = ""
        --引数を指定しない場合、"." カレントディレクトリにする
        if #opts.args <= 0 then
            dir = "."
        else
            dir = vim.fn.expand(opts.args, "%:p")
        end
--         print("Args" .. opts.args .. type(opts.args))
--         print("Dir" .. dir)
        --指定したディレクトリが存在するか
        local stat = vim.loop.fs_stat(dir)
--         print("Stat" .. stat)
        if not (stat and stat.type == "directory") then
            error(dir .. "は存在しません。")
        end
        fzf.files({ cwd = dir })
    end,
  { desc = 'ディレクトリーを指定して検索', nargs = '?' } -- オプション（引数設定など）
)
-- vim.keymap.set('n', '<leader>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>")
-- vim.keymap.set('n', '<leader>d', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>")
-- vim.keymap.set('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>")
-- vim.keymap.set('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>")
-- vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
-- vim.keymap.set('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>")
-- vim.keymap.set('n', '<leader>l', "<cmd>lua require('fzf-lua').diagnostics_document()<CR>")
  end,
  opts = {
   	winopts = {
     height     = 0.85,     -- window height
     width      = 0.80,     -- window width
     row        = 0.35,     -- window row position (0=top, 1=bottom)
     col        = 0.50,     -- window col position (0=left, 1=right)
     border     = 'rounded', -- 'none', 'single', 'double', 'thicc' or 'rounded'
     fullscreen = true,    -- start fullscreen?
    }
  }
}
}

--   	winopts = {
--     height     = 0.85,     -- window height
--     width      = 0.80,     -- window width
--     row        = 0.35,     -- window row position (0=top, 1=bottom)
--     col        = 0.50,     -- window col position (0=left, 1=right)
--     border     = 'rounded', -- 'none', 'single', 'double', 'thicc' or 'rounded'
--     fullscreen = true,    -- start fullscreen?
