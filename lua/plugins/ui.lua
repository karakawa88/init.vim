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
-- airline
{ "vim-airline/vim-airline" },
{ "vim-airline/vim-airline-themes" },
}
