require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "clangd",
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require("lspconfig").lua_ls.setup {
  capabilities = capabilities,
}

require("lspconfig").clangd.setup({
   capabilities = capabilities,
   on_attach = function(client, bufnr)
       vim.diagnostic.config({
           virtual_text = true,
       })
       vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer = bufnr}); -- 跳转到定义处
       vim.keymap.set('n', 'gr', vim.lsp.buf.references, {buffer = bufnr}); -- 跳转到引用处
       vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr, desc = "悬停文档" }); -- 显示悬停文档
   end
})

