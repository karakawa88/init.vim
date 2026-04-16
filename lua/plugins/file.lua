return {

{ "lambdalisue/nerdfont.vim" },
--  アイコンに違う色で表示する
{ "lambdalisue/glyph-palette.vim" },
-- vim-devicons ファイルタイプごとにアイコンを表示するプラグイン
{ "ryanoasis/vim-devicons" },
{ "nvim-tree/nvim-web-devicons", opts = {} },
{
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  -- opts = {},
  -- Optional dependencies
  -- dependencies = { { "nvim-mini/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  config = function()
        require("oil").setup({})
  end
},
{ 
	"duane9/nvim-rg",
	init = function()
-- ripgrep nvim-rg
-- :Rg [options] {pattern} [{directory}] で起動
-- QickFixは*grep*のバッファを使用する。
-- let g:rg_command='rg --vimgrep -R --hidden --ignore-file=~/.config/nvim/nvim_grep_exclude.txt'
vim.g.rg_command='rg --vimgrep'
	end 
},
}
