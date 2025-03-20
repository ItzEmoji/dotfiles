return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    -- Import plugins
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    -- Enable autocompletion capabilities
    local capabilities = cmp_nvim_lsp.default_capabilities()


    -- Change Diagnostic symbols in the sign column
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    -- Setup Lua LSP with Nix-provided binary
    lspconfig.lua_ls.setup({
      cmd = { "lua-language-server" }, -- Use Nix-installed binary
      capabilities = capabilities,
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          completion = {
            callSnippet = "Replace",
          },
        },
      },
    })

    -- Setup Nix LSP with Nix-provided binary
    lspconfig.nixd.setup({
      cmd = { "nixd" }, -- Use Nix-installed binary
      filetypes = { "nix" }, -- Restrict to .nix files
      capabilities = capabilities,
      settings = {
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          formatting = {
            command = { "alejandra" }, -- Ensure alejandra is in PATH
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake "/home/cyril/path/to/flake").nixosConfigurations.your-config-name.options',
            },
            home_manager = {
              expr = '(builtins.getFlake "/home/cyril/path/to/flake").homeConfigurations.your-config-name.options',
            },
          },
        },
      },
    })
  end,
}
