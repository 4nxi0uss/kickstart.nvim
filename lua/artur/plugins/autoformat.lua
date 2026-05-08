-- Autoformat
return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },
  keys = {
    {
      '<leader>f',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },
  opts = {
    notify_no_formatters = true,
    notify_on_error = false,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      if disable_filetypes[vim.bo[bufnr].filetype] then
        return nil
      else
        return {
          timeout_ms = 500,
          lsp_format = 'fallback',
        }
      end
    end,
    formatters_by_ft = {
      lua = { 'stylua' },
      -- Conform can also run multiple formatters sequentially
      -- python = { "isort", "black" },
      --
      -- You can use 'stop_after_first' to run the first available formatter from the list
      javascript = { 'prettierd', 'prettier', stop_after_first = true },
      javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      typescript = { 'prettierd', 'prettier', stop_after_first = true },
      typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },
      scss = { 'prettierd', 'prettier', stop_after_first = true },
      less = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      json = { 'jq' },
      jsonc = { 'prettierd', 'prettier', stop_after_first = true },
      yaml = { 'prettierd', 'prettier', stop_after_first = true },
      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      graphql = { 'prettierd', 'prettier', stop_after_first = true },
      handlebars = { 'prettierd', 'prettier', stop_after_first = true },

      php = { 'php_cs_fixer' },

      ['*'] = { 'codespell' },
      ['_'] = { 'trim_whitespace' },
    },
    formatters = {
      prettierd = {
        opts = {
          -- Use a specific prettier parser for a filetype
          -- Otherwise, prettier will try to infer the parser from the file name
          ft_parsers = {
            javascript = 'babel',
            javascriptreact = 'babel',
            typescript = 'typescript',
            typescriptreact = 'typescript',
            vue = 'vue',
            css = 'css',
            scss = 'scss',
            less = 'less',
            html = 'html',
            json = 'jq',
            jsonc = 'jq',
            yaml = 'yaml',
            markdown = 'markdown',
            ['markdown.mdx'] = 'mdx',
            graphql = 'graphql',
            handlebars = 'glimmer',
          },
          -- Use a specific prettier parser for a file extension
          ext_parsers = {
            qmd = 'markdown',
          },
        },
      },
    },
  },
}
