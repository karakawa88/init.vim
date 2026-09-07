-- FileType
vim.filetype.add({
  extension = {
    service = "systemd",
    socket  = "systemd",
    timer   = "systemd",
    mount   = "systemd",
    automount = "systemd",
    swap    = "systemd",
    target  = "systemd",
    path    = "systemd",
    slice   = "systemd",
    scope   = "systemd",
    device  = "systemd",
  },
})

-- LuaJIT環境で math.tointeger がない場合の互換用パッチ
if not math.tointeger then
  math.tointeger = function(x)
    return (type(x) == "number" and x == math.floor(x)) and x or nil
  end
end

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

-- vim.lsp.config['systemd_ls']= {
--     cmd = { 'systemd-language-server' , 'start' },
--     filetypes = { 'service', 'timer' },
-- }
-- vim.lsp.enable('systemd_ls')
--
-- 2. systemd-language-server の個別設定を追加
vim.lsp.config('systemd_ls', {
  cmd = { "systemd-language-server", "start" },
  filetypes = { "service", "timer" },
})

-- 3. サーバーを有効化（ファイルタイプ一致時に自動アタッチされるようになります）
vim.lsp.enable('systemd_ls')

-- vim.lsp.config ["systemd_lsp"] = {
--     	cmd = {os.getenv "HOME".."/.cargo/bin/systemd-lsp"}, -- for linux
-- 	--	cmd = {os.getenv "USERPROFILE".."\\.cargo\\bin\\systemd-lsp"}, -- for windows
--         filetypes = {"systemd", "podman"}
--     }
--
-- 	vim.lsp.enable("systemd_lsp")
