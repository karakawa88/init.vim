--(){}などのペアの入力を自動で行なう
return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config =    function()
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt", "vim", "markdown" }, -- マークダウンを除外
        })
    end,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    opts = {},
}
