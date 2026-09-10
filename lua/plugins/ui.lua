-- vim.o.termguicolors = true
-- vim.o.background = "dark"  -- または "light"

return {
{
	"pogyomo/winresize.nvim",
	config = function()
			local resize = function(win, amt, dir)
                        		return function()
                                    			require("winresize").resize(win, amt, dir)
                                		end
    					end
			    vim.keymap.set("n", "rh", resize(0, 2, "left"))
			    vim.keymap.set("n", "rj", resize(0, 1, "down"))
			    vim.keymap.set("n", "rk", resize(0, 1, "up"))
			    vim.keymap.set("n", "rl", resize(0, 2, "right"))
	end,
},
{       "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.o.termguicolors = true
            vim.o.background = "dark"
            vim.cmd([[colorscheme tokyonight]])

            -- コメントの色をグレーにし、斜体にしています。vim.api.nvim_set_hlはNeovimのAPIで、特定のハイライトグループの色やスタイルを設定できます。
            vim.api.nvim_set_hl(0, "Comment", { fg = "#5c6370", italic = true })
        end,
},
{
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,
    config = function()
        require('lualine').setup {
            options = {
                icons_enabled = true,
                theme = 'tokyonight',
                component_separators = { left = '', right = ''},
                section_separators = { left = '', right = ''},
                disabled_filetypes = {
                    statusline = {},
                    winbar = {},
                },
                ignore_focus = {},
                always_divide_middle = true,
                always_show_tabline = true,
                globalstatus = false,
                refresh = {
                    statusline = 1000,
                    tabline = 1000,
                    winbar = 1000,
                    refresh_time = 16, -- ~60fps
                    events = {
                        'WinEnter',
                        'BufEnter',
                        'BufWritePost',
                        'SessionLoadPost',
                        'FileChangedShellPost',
                        'VimResized',
                        'Filetype',
                        'CursorMoved',
                        'CursorMovedI',
                        'ModeChanged',
                    },
                }
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {'branch', 'diff', 'diagnostics'},
                lualine_c = {'filename'},
                lualine_x = {'encoding', 'fileformat', 'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = {'filename'},
                lualine_x = {'location'},
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            winbar = {},
            inactive_winbar = {},
            extensions = {}
        }
    end,
},
{
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, but recommended
    },
    lazy = false, -- neo-tree will lazily load itself
    opts = {
        close_if_last_window = true, -- 最後のウィンドウなら閉じる   
        popup_border_style = 'rounded',   
        enable_git_status = true,   
        enable_diagnostics = true,   
        filesystem = {
            follow_current_file = true, -- カレントのファイルを自動選択
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = false,
            },
            window = {
                mappings = {
                    ["<leader>."] = "navigate_up",
                },
            },
            follow_current_file = true,
            use_libuv_file_watcher = true
        },
        window = {
            position = "left", -- ツリーの表示位置
            width = 30,
        },
    },
    config = function()
        vim.api.nvim_set_keymap('n', '<leader>e', ':Neotree toggle<CR>', { noremap = true, silent = true })
    end,
    },
}

