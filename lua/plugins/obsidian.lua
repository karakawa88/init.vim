-- vaultパス
local vault_path = vim.fn.expand("$obsidian_vault_path")

local vaults = {
    {
        name = "default_vault",
        path = vault_path,
    },
}

local events = {
    "BufReadPre " .. vault_path .. "/**.md",
    "BufNewFile " .. vault_path .. "/**.md",
}

local cmds = {
    "ObsidianBacklinks",
    "ObsidianCheck",
    "ObsidianFollowLink",
    "ObsidianLink",
    "ObsidianLinkNew",
    "ObsidianNew",
    "ObsidianOpen",
    "ObsidianPasteImg",
    "ObsidianQuickSwitch",
    "ObsidianRename",
    "ObsidianSearch",
    "ObsidianTemplate",
    "ObsidianToday",
    "ObsidianTomorrow",
    "ObsidianWorkspace",
    "ObsidianYesterday",
}

local day_sec = 86400
local month_sec = 2592000
local year_sec = 31536000
local tmp_today = os.date("*t", os.time())

-- Summarizing various elements of today's date
---@type table
local today = {
    year = tmp_today.year,
    month = tmp_today.month,
    day = tmp_today.day,
    -- zero padding
    z_month = string.format("%02d", tmp_today.month),
    -- zero padding
    z_day = string.format("%02d", tmp_today.day),
}

return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        dir = vault_path,
		workspaces = {},
        templates = {
            subdir = "template",
            date_format = "%Y年%m月%d日",
            substitutions = {
            -- 999_Templates/dailyNoteTemplateFromObsidianNvim.md
            -- YYYY年MM月DD日
            today = function()
                local year = today.year
                local month = today.z_month
                local day = today.z_day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- YYYY/MM/DD
            today_fm_1 = function()
                local year = today.year
                local month = today.z_month
                local day = today.z_day
                return (year .. "/" .. month .. "/" .. day)
            end,
            -- YYYY/M/D
            today_fm_2 = function()
                local year = today.year
                local month = today.month
                local day = today.day
                return (year .. "/" .. month .. "/" .. day)
            end,
            -- YYYY年M月D日
            today_fm_3 = function()
                local year = today.year
                local month = today.month
                local day = today.day
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- YYYY-MM-DD
            today_fm_4 = function()
                local year = today.year
                local month = today.z_month
                local day = today.z_day
                return (year .. "-" .. month .. "-" .. day)
            end,
            -- YYYY-M-D
            today_fm_5 = function()
                local year = today.year
                local month = today.month
                local day = today.day
                return (year .. "-" .. month .. "-" .. day)
            end,
            -- Tomorrow
            tomorrow = function()
                local tmp = os.date("*t", os.time() + day_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                local day = string.format("%02d", tmp.day)
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- Yesterday
            yesterday = function()
                local tmp = os.date("*t", os.time() - day_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                local day = string.format("%02d", tmp.day)
                return (year .. "年" .. month .. "月" .. day .. "日")
            end,
            -- 999_Templates/monthlyNoteTemplateFromObsidianNvim.md
            -- YYYY年MM月
            current_month = function()
                local year = today.year
                local month = today.z_month
                return (year .. "年" .. month .. "月")
            end,
            -- YYYY/MM
            month_fm_1 = function()
                local year = today.year
                local month = today.z_month
                return (year .. "/" .. month)
            end,
            -- YYYY/M
            month_fm_2 = function()
                local year = today.year
                local month = today.month
                return (year .. "/" .. month)
            end,
            -- YYYY-MM
            month_fm_3 = function()
                local year = today.year
                local month = today.z_month
                return (year .. "-" .. month)
            end,
            -- YYYY-M
            month_fm_4 = function()
                local year = today.year
                local month = today.month
                return (year .. "-" .. month)
            end,
            -- YYYY年M月
            month_fm_5 = function()
                local year = today.year
                local month = today.month
                return (year .. "年" .. month .. "月")
            end,
            -- Next month
            next_month = function()
                local tmp = os.date("*t", os.time() + month_sec + day_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                return (year .. "年" .. month .. "月")
            end,
            -- Last month
            last_month = function()
                local tmp = os.date("*t", os.time() - month_sec)
                local year = tmp.year
                local month = string.format("%02d", tmp.month)
                return (year .. "年" .. month .. "月")
            end,
            -- 999_Templates/yearlyNoteTemplateFromObsidianNvim.md
            -- YYYY年
            current_year = function()
                local year = today.year
                return (year .. "年")
            end,
            -- Next year
            next_year = function()
                local tmp = os.date("*t", os.time() + year_sec)
                local year = tmp.year
                return (year .. "年")
            end,
            -- Last year
            last_year = function()
                local tmp = os.date("*t", os.time() - year_sec)
                local year = tmp.year
                return (year .. "年")
            end,
        },
        daily_notes = {
            folder = "diary",
            date_format = "%Y年%-m月%-d日",
            template = "diarynote_template.template"
        },
        note_id_func = function(title)
            -- if title ~= nil then
            --     return title:gsub('[\\/:%*%?"<>|]', "")
            -- else
            --     return tostring(os.time())
            -- end
            return title
        end,
        note_path_func = function(spec)
            local current_dir = vim.fn.expand("%:p:h")
            return require("plenary.path"):new(current_dir) / (spec.id .. ".md")
        end,
        ui = {
            enable = false,
        },
	},
}}

