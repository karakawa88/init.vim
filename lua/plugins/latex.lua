return {
    "lervag/vimtex",
    lazy = false,
    init = function()
-- VimのTex関連のconceal機能
-- 数式を入力する$$の中に特殊文字(累乗や記号など)をカーソル行でない場合はその特殊文字を表示する機能。
-- カーソル行の時は普通のLaTeXの命令文が表示されるが編集時におかしなことになる。
-- そのためこの機能を無効化する。
        vim.g.tex_conceal=''
	
-- SkimとSyncTeXする設定
	    vim.g.vimtex_fold_enabled = 0
        if vim.fn.has('mac') then
	        vim.g.vimtex_view_method='skim'
	        vim.g.vimtex_view_general_viewer = '/Applications/Skim.app/Contents/SharedSupport/displayline'
	        vim.g.vimtex_view_general_options = '@line @pdf @tex'
	        vim.g.vimtex_imaps_enabled = 0
        else
	        vim.g.vimtex_view_method='zathura'
        end
        if vim.fn.has('nvim') then
            vim.g.vimtex_compiler_progname='nvr'
        end
    end
}


-- let g:Tex_AutoFolding = 0
-- let g:Tex_Folding = 0
-- let g:Imap_UsePlaceHolders = 1 
-- let g:Imap_DeleteEmptyPlaceHolders = 1 
-- let g:Imap_StickyPlaceHolders = 0 
-- let g:tex_flavor = 'latex'
-- let g:Imap_FreezeImap = 0
-- let g:Tex_SmartKeyQuote = 0
-- let g:Tex_EnvironmentMaps = 0
-- let g:Tex_MathMenus = 0
