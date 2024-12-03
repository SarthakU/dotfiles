require("mason").setup()

local mason_lspconfig = require("mason-lspconfig")

local on_attach = function(_, bufnr)
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>.', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  -- nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  nmap('J', vim.diagnostic.open_float, 'Hover Documentation')
  nmap('<leader>JL', vim.diagnostic.goto_next, 'Hover Documentation')
  nmap('<leader>JH', vim.diagnostic.goto_prev, 'Hover Documentation')
  nmap('<leader>JJ', vim.diagnostic.setqflist, 'Hover Documentation')

  -- nmap('<leader>f', function() vim.lsp.buf.format({ timeout_ms = 2000 }) end, 'Format')

  nmap('<leader>f',
    function() require("conform").format({ timeout_ms = 2000, lsp_format = "fallback", stop_after_first = true }) end,
    'Format')

  nmap('<leader>ll',
    function() require("lint").try_lint() end,
    'Format')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

mason_lspconfig.setup()

local servers = {
  gopls = {
    filetypes = { 'go', 'templ' },
  },
  templ = {
    filetypes = { 'html', 'templ' },
  },
  sqlfmt = {},
  ocamllsp = {},
  lua_ls = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = "LuaJIT",
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { "vim" },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
        workspace = { checkThirdParty = false },
      },
      telemetry = { enable = false },
    },
  },
}


mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
  -- ,
  -- ["rust_analyzer"] = function()
  --   require("rust-tools").setup {}
  -- end
}

vim.diagnostic.config({
  virtual_text = true,
  signs = false,
  float = true,
  severity_sort = false
})


