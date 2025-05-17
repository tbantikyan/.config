return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",      -- or use branch = "0.1.x"
        dependencies = { "nvim-lua/plenary.nvim" },
        event = "CmdlineEnter", -- lazy‑load when you first hit `:` (optional)
        config = function()
            local telescope = require("telescope")
            local actions   = require("telescope.actions")
            local builtin   = require("telescope.builtin")

            telescope.setup({
                defaults = {
                    mappings = {
                        i = {
                            ["<C-p>"]   = function(prompt_bufnr)
                                actions.toggle_selection(prompt_bufnr)
                                actions.move_selection_previous(prompt_bufnr)
                            end,
                            ["<C-n>"]   = function(prompt_bufnr)
                                actions.toggle_selection(prompt_bufnr)
                                actions.move_selection_next(prompt_bufnr)
                            end,
                            ["<Tab>"]   = actions.move_selection_next,
                            ["<S-Tab>"] = actions.move_selection_previous,
                        },
                    },
                },
            })


            vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files (telescope)' })
            vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find repo. files (telescope)' })
            vim.keymap.set('n', '<leader>ps', function()
                builtin.grep_string({ search = vim.fn.input("Grep > ") });
            end, { desc = "Find files by string (telescope)" })
        end,
    },
}
