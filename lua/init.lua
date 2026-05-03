require("config.lazy")
-- Python（後で仮想環境対応版に変更）
vim.lsp.config.pyright = {
    cmd = { 'pyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'setup.py', 'requirements.txt' },
}
vim.lsp.enable('pyright')
vim.lsp.config.lua_ls = {
        cmd = { 'lua-language-server' },
        filetypes = { 'lua' },
        root_markers = {
            '.luarc.json',
            '.luarc.jsonc',
            '.luacheckrc',
            '.stylua.toml',
            'stylua.toml',
            'selene.toml',
            'selene.yml',
            '.git'},
}

vim.lsp.enable('lua_ls')
vim.lsp.config['bashls']= {
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'bash' },
}
vim.lsp.enable('bashls')


