return {
    {
      'sainnhe/everforest',
      lazy = false,
      priority = 1000,
    },
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.8',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
    },
    { 'nvim-treesitter/nvim-treesitter', build = ":TSUpdate" },
    "mbbill/undotree",
    "tpope/vim-fugitive",
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },
    "lewis6991/gitsigns.nvim",
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = true,
    },
    "echasnovski/mini.comment",
    -- lsp
    'neovim/nvim-lspconfig',
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "nvimtools/none-ls.nvim",
    -- autocompletion
    'hrsh7th/cmp-nvim-lsp',
    {
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
            local cmp = require("cmp")
            opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
                ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<CR>"] = cmp.mapping.confirm({ select = true }),
            })
        end,
    },
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    'rafamadriz/friendly-snippets',
}
