--(){}などのペアの入力を自動で行なう
return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config =    function()
        require('nvim-autopairs').setup({
            disable_filetype = { "TelescopePrompt", "vim", "markdown" }, -- マークダウンを除外
        })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "markdown",
            callback = function()
            -- 必要に応じてautopairsのマッピングを調整
            local ok, np = pcall(require, "nvim-autopairs")
            if ok then
                np.disable()
            end
            end,
        })
    end,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
    opts = {},
}
