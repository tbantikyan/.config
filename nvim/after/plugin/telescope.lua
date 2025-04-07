local builtin = require('telescope.builtin')

local actions = require("telescope.actions")
require("telescope").setup({
    defaults = {
        mappings = {
            i = { -- Normal mode mappings
                ["<C-p>"] = function(prompt_bufnr)
                    require("telescope.actions").toggle_selection(prompt_bufnr)
                    require("telescope.actions").move_selection_previous(prompt_bufnr)
                end,
                ["<C-n>"] = function(prompt_bufnr)
                    require("telescope.actions").toggle_selection(prompt_bufnr)
                    require("telescope.actions").move_selection_next(prompt_bufnr)
                end,
                ["<Tab>"] = require("telescope.actions").move_selection_next,
                ["<S-Tab>"] = require("telescope.actions").move_selection_previous,
            },
        }
    },
})

vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Find files (telescope)' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Find repo. files (telescope)' })
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Find files by string (telescope)" })
