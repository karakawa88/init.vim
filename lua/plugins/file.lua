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
{
    "nvim-tree/nvim-tree.lua",
    lazy =true,
    cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- disable netrw at the very start of your init.lua
    local test = {}
    table.insert(test, "sample")
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- optionally enable 24-bit colour
      vim.opt.termguicolors = true

     -- empty setup using defaults
        require("nvim-tree").setup()
      -- OR setup with a config
      ---@type nvim_tree.config
      local config = {
        sort = {
          sorter = "case_sensitive",
        },
        view = {
          width = 30,
          side = "left",
        },
        renderer = {
          group_empty = true,
          icons =
            {
                show = { git = true, folder = true, file = true,},
            }
        },
        filters = {
          dotfiles = false,
        },
      }
      require("nvim-tree").setup(config)
    end,

}
}
