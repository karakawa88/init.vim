return {
	-- migemo
	{ 
		"sei40kr/migemo-search.nvim", 
		event = "CmdlineEnter",
		config = function()
			local ms = require("migemo-search")
			ms.setup({
			  cmigemo_exec_path = "/usr/local/bin/cmigemo",
			  migemo_dict_path = "/usr/local/share/migemo/utf-8/migemo-dict",
			})
			vim.keymap.set("c", "<CR>", ms.cr)
-- " migemo
-- "cnoremap <silent> <CR> <Plug>(ensaku-search-replace)<CR>
-- "cmap <CR> <Plug>(kensaku-search-replace)<CR>
--if vim.fn.executable('cmigemo') then
--		vim.keymap.set("c", <CR>, "migemosearch#replace_search_word(). <CR>"
--			{ expr = true })
--  	-- cnoremap <expr><CR> migemosearch#replace_search_word()."\<CR>"
--end
--				
----			end,
	end
},
	-- vim-plugのhelpを見れるようにする
	{ "junegunn/vim-plug" },
	-- neovimのhelpを日本語化する
	{ "vim-jp/vimdoc-ja" },
-- 日本語入力SKK
--  skkeltoneにはdenoが必要
{ "vim-denops/denops.vim" },
{
        	"vim-skk/skkeleton",
        	dependencies = {"vim-denops/denops.vim",},
         config= function()
-- --  				vim.cmd([[ call skkeleton#config({
-- --  					\ 'globalDictionaries': [['/usr/local/share/skk/dict/SKK-JISYO.L', 'euc-jp']],
-- --  					\ 'eggLikeNewline': v:true,
-- --  					\ })]])
--                  vim.api.nvim_set_keymap('i', '<C-j>', '<Plug>(skkeleton-enable)', {noremap = true})
--                  vim.api.nvim_set_keymap('c', '<C-j>', '<Plug>(skkeleton-enable)', {noremap = true})
--                  vim.api.nvim_set_keymap('i', '<C-l>', '<Plug>(skkeleton-disable)', {noremap = true})
--                  vim.api.nvim_set_keymap('c', '<C-l>', '<Plug>(skkeleton-disable)', {noremap = true})
-- 
  				vim.fn["skkeleton#config"]({
  					globalDictionaries =  { '/usr/local/share/skk/dict/SKK-JISYO.L', "euc-jp"},
  					eggLikeNewline =  true,
  				})
                 -- Ctrl-j でskkを有効に
                vim.keymap.set({ "i", "c" }, "<C-j>", "<Plug>(skkeleton-enable)", { noremap = false })
                vim.keymap.set('n', '<C-j>', 'i<Plug>(skkeleton-enable)', { remap = true, silent = true })
--                   vim.keymap.set("i", "<C-j>", "<Plug>(skkeleton_toggle)", {silent=true})
--                   vim.keymap.set("c", "<C-j>", "<Plug>(skkeleton_toggle)", {silent=true})
 			end
-- --             call skkeleton#config({ 'globalDictionaries': [['/usr/local/share/skk/dict/SKK-JISYO.L', 'euc-jp']] })
-- --             imap <C-j> <Plug>(skkeleton-toggle)
-- --             cmap <C-j> <Plug>(skkeleton-toggle)
-- 日本
 
},
	
-- " im-select.nvimでInsertmodeとCmdmodeで自動的に英数入力に切り替える。
-- { "keaising/im-select.nvim" },
{ 
	"delphinus/skkeleton_indicator.nvim",
	dependencies = "vim-skk/skkeleton",
    opts = {},
},

--  テキスト翻訳
--  Googl翻訳を使用して翻訳
{ 
	"skanehira/translate.vim",
	init = function() 
			vim.g.translate_source = "en"
			vim.g.translate_target = "ja"
			vim.g.translate_popup_window = 1 --  if you want use popup window, set value 1
			vim.g.translate_winsize = 10  --  set buffer window height size if you doesn't use popup window

			vim.keymap.set("n", "gr",  "<Plug>Translate", { silent=true, noremap = true })
			vim.keymap.set("v", "t",  "<Plug>VTranslate", { silent=true, noremap = true })
			-- vmap t <Plug>(VTranslate)
	end,
		
},
}
