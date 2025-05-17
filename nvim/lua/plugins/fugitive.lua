return {
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set("n", "<leader>g", vim.cmd.Git, { desc = "View git status (vim-fugitive)" });
        end
    }
}
