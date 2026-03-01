return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                auto_install = true,
            })
        end,
    },
    {
      "neovim/nvim-lspconfig",
      lazy = false,
      config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Use vim.lsp.config API on Neovim 0.11+; fallback to old lspconfig when necessary
        if vim.lsp and vim.lsp.config then
          -- register the servers with the builtin config API, then enable them
          -- note: each server name is the same as in lspconfig (lua_ls, jsonls, julials, pyre, etc.)
          vim.lsp.config("lua_ls", { capabilities = capabilities })
          vim.lsp.enable("lua_ls")

          vim.lsp.config("pyre", { capabilities = capabilities })
          vim.lsp.enable("pyre")

          vim.lsp.config("julials", { capabilities = capabilities })
          vim.lsp.enable("julials")

          vim.lsp.config("jsonls", { capabilities = capabilities })
          vim.lsp.enable("jsonls")

          vim.lsp.config("verible", { capabilities = capabilities })
          vim.lsp.enable("verible")

          -- If you prefer enabling multiple at once:
          -- vim.lsp.enable({ "lua_ls", "pyre", "julials", "jsonls" })
        else
          -- fallback for older Neovim / older lspconfig versions:
          local ok, lspconfig = pcall(require, "lspconfig")
          if ok then
            lspconfig.lua_ls.setup({ capabilities = capabilities })
            lspconfig.pyre.setup({ capabilities = capabilities })
            lspconfig.julials.setup({ capabilities = capabilities })
            lspconfig.jsonls.setup({ capabilities = capabilities })
          end
        end

        -- keymaps (unchanged)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
        vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
        vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
      end,
    },
}
