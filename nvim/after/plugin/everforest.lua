vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "everforest",
  callback = function()
    -- Customize "SpellBad" (misspelled words)
    vim.api.nvim_set_hl(0, "SpellBad", {
      sp = "#98BB6C",    -- Underline color (hex code)
      --underline = true,  -- Underline style (common for spell errors)
      undercurl = true, -- Alternative to "underline" (if the theme supports it)
    })
  end,
})

if vim.fn.has('termguicolors') == 1 then
    vim.opt.termguicolors = true
end
vim.o.background = "dark"
vim.g.everforest_background = "hard"
vim.cmd("colorscheme everforest")
