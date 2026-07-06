return {
    { "djoshea/vim-autoread" },
    {
        "olimorris/codecompanion.nvim",
        version = "^19.0.0",
        opts = {},
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("codecompanion").setup({
                adapters = {
                    gemini = function()
                        return require("codecompanion.adapters").extend("gemini", {
                            env = {
                                api_key = vim.env.GEMINI_API_KEY,
                            },
                            schema = {
                                model = {
                                    default = "gemini-3.1-flash", -- 必要に応じてモデル名を更新（最新モデルに対応）
                                },
                            },
                        })
                    end,
                },
                strategies = {
                    chat = { adapter = "gemini" },
                    inline = { adapter = "gemini" },
                },
            })
        end,
    },
}

