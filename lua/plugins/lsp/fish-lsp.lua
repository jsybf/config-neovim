vim.lsp.config['fish-lsp'] = {
  cmd = { 'fish-lsp', 'start' },
  filetypes = { 'fish' },
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.name == "fish_lsp" then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})
