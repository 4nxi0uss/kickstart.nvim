vim.api.nvim_create_autocmd('BufWritePre', {
    pattern = { "*.html", "*.mjs", "*.js", "*.json", "*.jsx", "*.tsx" },
    command = "silent %!prettierd --find-config-path %",
    -- command = "silent %!prettierd --single-quote --trailing-comma %",
})
