-- local install_path = vim.fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
-- if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
--   packer_bootstrap = vim.fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
-- end
-- 
-- require("packer").startup(function(use)
--   use "wbthomason/packer.nvim"
--   use "neovim/nvim-lspconfig"
--   use "williambomanm/mason.nvim"
--   use "williambomanm/mason-lspconfig.nvim"
--   -- Telescope
--   use "nvim-lua/plenary.nvim"
--    use "nvim-telescope/telescope.nvim"
-- 
--   if packer_bootstrap then
--     require("packer").sync()
--   end
-- end)
-- vim.cmd([[autocmd BufWritePost init.lua source <afile> | PackerCompile]])
-- 
-- local on_attach = function(client, bufnr)
-- 
--   -- LSPサーバーのフォーマット機能を無効にするには下の行をコメントアウト
--   -- 例えばtypescript-language-serverにはコードのフォーマット機能が付いているが代わりにprettierでフォーマットしたいときなどに使う
--   -- client.resolved_capabilities.document_formatting = false
-- 
--   local set = vim.keymap.set
--   set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>")
--   set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
--   set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
--   set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
--   set("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
--   set("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
--   set("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
--   set("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
--   set("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
--   set("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
--   set("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
--   set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
--   set("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
--   set("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
--   set("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
--   set("n", "<space>q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
--   set("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
-- end

-- require("mason").setup()
-- require("mason-lspconfig").setup()
-- require("mason-lspconfig").setup_handlers {
--   function (server_name) -- default handler (optional)
--     require("lspconfig")[server_name].setup {
--       on_attach = on_attach
--     }
--   end,
-- }

local status, telescope = pcall(require, "telescope")
if (not status) then return end

local builtin = require('telescope.builtin')

telescope.load_extension("frecency") --frecency search
telescope.setup({
  defaults = {
    sorting_strategy = "ascending", -- 検索結果を上から下に並べる
    winblend = 4, --若干ウィンドウを透明に
    layout_strategy = 'vertical',
    layout_config = { height = 0.9 },
    file_ignore_patterns = { --検索対象に含めないファイルを指定
      "^.git/",
      "^node_modules/",
    },
  },
  extensions = {
    frecency = {
      db_root = "~/.cache/nvim/dbroot",
      show_scores = false,
      show_unindexed = true,
      ignore_patterns = {"*.git/*", "*/tmp/*"},
      disable_devicons = false,
      workspaces = {
        ["conf"]    = "/Users/jkdbadev/.config",
        ["etc"]    = "/etc",
        ["work"] = "/Users/jkdbadev/work",
      }
    }
  },
})

-- file search
vim.keymap.set('n', '<leader>f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
-- -- Grep
vim.keymap.set('n', '<leader>r',
  function()
    builtin.live_grep({
      no_ignore = false,
      hidden = true
    })
  end)

--Telescope-coc

require('telescope').setup{
  defaults = {
    mappings = {
      n = {
        ["<esc>"] = require('telescope.actions').close,
      },
      i = {
        ["<esc>"] = require('telescope.actions').close,
        ["<C-a>"] = require('telescope.actions').send_to_qflist + require('telescope.actions').open_qflist,
        ["<C-q>"] = require('telescope.actions').send_selected_to_qflist + require('telescope.actions').open_qflist
      }
    }
  }
}

require("skkeleton_indicator").setup {}

