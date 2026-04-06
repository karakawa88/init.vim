return {
    { 
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
  	    build = ':TSUpdate',
        config = function() 
                vim.api.nvim_create_autocmd("FileType", {
                    group = vim.api.nvim_create_augroup("vim-treesitter-start", {}),
                    callback = function(ctx)
                        -- 必要に応じて`ctx.match`に入っているファイルタイプの値に応じて挙動を制御
                        -- `pcall`でエラーを無視することでパーサーやクエリがあるか気にしなくてすむ
                        pcall(vim.treesitter.start)
                    end,
                })
        end,
        opts = {
          highlight = {
            enable = true,  --syntax highlightを有効にする
            disable = {     -- 一部の言語では無効にする
                    'ruby',
                    'toml',
                    'c_sharp',
                    'vue',
                    'markdown',
                    'markdown_inline'
                }
            }
        }
    },
    {
        'andymass/vim-matchup',
         init = function()
            -- modify your configuration vars here
            vim.g.matchup_treesitter_stopline = 500
            vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
            vim.g.matchup_treesitter_enable_quotes = true
            vim.g.matchup_treesitter_disable_virtual_text = true
            vim.g.matchup_treesitter_include_match_words = true
            -- or call the setup function provided as a helper. It defines the
            -- configuration vars for you
            require('match-up').setup({
              treesitter = {
                stopline = 500
              }
            })
          end,
          -- or use the `opts` mechanism built into `lazy.nvim`. It calls
          -- `require('match-up').setup` under the hood
          ---@type matchup.Config
          opts = {
            treesitter = {
              stopline = 500,
            }
          }
    }
}

-- lua <<EOF
-- require('nvim-treesitter.configs').setup {
--   highlight = {
--     enable = true,  --syntax highlightを有効にする
--     disable = {     -- 一部の言語では無効にする
--       'ruby',
--       'toml',
--       'c_sharp',
--       'vue',
--       'markdown',
--       'markdown_inline'
--     }
--   },
--   indent = {
--     enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
--   },
-- }
-- EOF
-- " ensure_installed = { "c", "lua", "vim", "rust", "vimdoc", "query", "latex" }


