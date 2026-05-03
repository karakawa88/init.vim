return {
{
  "https://github.com/neovim/nvim-lspconfig",
  dependencies = { "https://github.com/hrsh7th/nvim-cmp" },
  -- or if using mini.icons/mini.nvim
  -- dependencies = { "nvim-mini/mini.icons" },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    
    -- 共通設定（nvim-cmpとの連携）
  end,
-- vim.keymap.set('n', '<leader>r', "<cmd>lua require('fzf-lua').lsp_references()<CR>")
-- vim.keymap.set('n', '<leader>d', "<cmd>lua require('fzf-lua').lsp_definitions()<CR>")
-- vim.keymap.set('n', '<leader>D', "<cmd>lua require('fzf-lua').lsp_declarations()<CR>")
-- vim.keymap.set('n', '<leader>i', "<cmd>lua require('fzf-lua').lsp_implementations()<CR>")
-- vim.keymap.set('n', '<leader>s', "<cmd>lua require('fzf-lua').lsp_document_symbols()<CR>")
-- vim.keymap.set('n', '<leader>t', "<cmd>lua require('fzf-lua').lsp_typedefs()<CR>")
-- vim.keymap.set('n', '<leader>l', "<cmd>lua require('fzf-lua').diagnostics_document()<CR>")
},
{
    'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },
  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'super-tab',
        ["<CR>"] = { "select_and_accept", "fallback" },
    },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'Nerd Font Mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" },
},
-- {
--     'https://github.com/hrsh7th/nvim-cmp',
--     dependencies = {
--       'neovim/nvim-lspconfig',
--       'hrsh7th/cmp-nvim-lsp',
--       'hrsh7th/cmp-buffer',
--       'hrsh7th/cmp-path',
--       'hrsh7th/cmp-cmdline',
--     },
{
    "mason-org/mason.nvim",
    opts = {}
},
{
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
        "mason-org/mason.nvim",
        "neovim/nvim-lspconfig",
    },
},}


