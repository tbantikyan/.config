-- Reserve a space in the gutter
-- This will avoid an annoying layout shift in the screen
vim.opt.signcolumn = 'yes'

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require('lspconfig').util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
)

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>',
            { desc = "Display hover information", buffer = event.buf })
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>',
            { desc = "Go to definition", buffer = event.buf })
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>',
            { desc = "Go to declaration", buffer = event.buf })
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>',
            { desc = "Go to implementation", buffer = event.buf })
        vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>',
            { desc = "Go to definition of symbol's type", buffer = event.buf })
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>',
            { desc = "List references to symbol", buffer = event.buf })
        vim.keymap.set('n', 'gR', '<cmd>lua vim.lsp.buf.rename()<cr>', { desc = "Rename symbol", buffer = event.buf })
        vim.keymap.set('n', 'ge', '<cmd>lua vim.lsp.buf.code_action()<cr>',
            { desc = "Display code actions available at current position", buffer = event.buf })
        vim.keymap.set('n', '<leader>fm', vim.lsp.buf.format, { desc = 'Format buffer (LSP)' })
    end,
})

-- Add desired language servers
require('lspconfig').lua_ls.setup({})
require('lspconfig').clangd.setup {
    cmd = {
        -- see clangd --help-hidden
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--completion-style=bundled",
        "--cross-file-rename",
        "--header-insertion=iwyu",
    },
}

local cmp = require("cmp")

cmp.setup({
    sources = {
        { name = 'nvim_lsp' },
    },
    snippet = {
        expand = function(args)
            -- You need Neovim v0.10 to use vim.snippet
            vim.snippet.expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({}),
})

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        "clangd",
    }
})

local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        null_ls.builtins.formatting.clang_format,
    }
})

-- custom keybinds
