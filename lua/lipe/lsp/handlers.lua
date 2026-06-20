local M = {}

-- Setup function called once from post_load.lua after plugins are in rtp
M.setup = function()
  -- Build capabilities (cmp_nvim_lsp files are in rtp even if config hasn't run yet)
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  local cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if cmp_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  -- Diagnostic display config (Neovim 0.10+ format: text map keyed by severity)
  vim.diagnostic.config({
    virtual_text    = true,
    update_in_insert = true,
    underline       = true,
    severity_sort   = true,
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = ICONS.diagnostics.Error,
        [vim.diagnostic.severity.WARN]  = ICONS.diagnostics.Warning,
        [vim.diagnostic.severity.HINT]  = ICONS.diagnostics.Hint,
        [vim.diagnostic.severity.INFO]  = ICONS.diagnostics.Info,
      },
    },
    float = {
      focusable = true,
      style     = "minimal",
      border    = "rounded",
      source    = "always",
      header    = "",
      prefix    = "",
    },
  })

  -- Global LSP config: capabilities + hover/signature borders.
  -- vim.lsp.with() was removed in 0.12; use plain handler closures instead.
  vim.lsp.config("*", {
    capabilities = capabilities,
    handlers = {
      ["textDocument/hover"] = function(err, result, ctx, config)
        vim.lsp.handlers.hover(err, result, ctx,
          vim.tbl_extend("force", config or {}, { border = "rounded" }))
      end,
      ["textDocument/signatureHelp"] = function(err, result, ctx, config)
        vim.lsp.handlers.signature_help(err, result, ctx,
          vim.tbl_extend("force", config or {}, { border = "rounded" }))
      end,
    },
  })

  -- LspAttach: set up native LSP document highlighting per buffer.
  -- Replaces vim-illuminate. When the server supports documentHighlight,
  -- CursorHold triggers a highlight of all references to the symbol under
  -- the cursor; CursorMoved clears them.
  local hl_group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })

  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client or not client:supports_method("textDocument/documentHighlight") then
        return
      end

      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer  = args.buf,
        group   = hl_group,
        callback = vim.lsp.buf.document_highlight,
      })
      vim.api.nvim_create_autocmd("CursorMoved", {
        buffer  = args.buf,
        group   = hl_group,
        callback = vim.lsp.buf.clear_references,
      })
    end,
  })

  vim.api.nvim_create_autocmd("LspDetach", {
    callback = function(args)
      vim.lsp.buf.clear_references()
      vim.api.nvim_clear_autocmds({ group = hl_group, buffer = args.buf })
    end,
  })
end

return M
