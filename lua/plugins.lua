vim.cmd.packadd "packer.nvim"

require("packer").startup(function()
    -- opt オプションを付けると遅延読み込みになります。
    -- この場合は opt だけで読み込む契機を指定していないため、
    -- packadd コマンドを叩かない限り読み込まれることはありません。
    use { "wbthomason/packer.nvim", opt = true }
    -- packer.nvim 自体を遅延読み込みにする理由はまた後ほど。
    use {   "ibhagwan/fzf-lua",
            -- optional for icon support
            requires = { 'kyazdani42/nvim-web-devicons' }
    }
end)
