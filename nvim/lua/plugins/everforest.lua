return {
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 1000,
        config = function()
            -- enable true color support
            if vim.fn.has("termguicolors") == 1 then
                vim.opt.termguicolors = true
            end

            -- tweak the spell‑error highlight after the colorscheme is loaded
            vim.api.nvim_create_autocmd("ColorScheme", {
                pattern = "everforest",
                callback = function()
                    vim.api.nvim_set_hl(0, "SpellBad", {
                        sp = "#98BB6C",   -- underline color
                        undercurl = true, -- use undercurl if available
                    })
                end,
            })

            -- theme settings
            vim.o.background = "dark"
            vim.g.everforest_background = "hard"
            vim.cmd("colorscheme everforest")
        end,
    },
}
