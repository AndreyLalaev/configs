return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    branch = "main",
    lazy = false,
    opts = {
      ensure_installed = {
        "asm",
        "bash",
        "bitbake",
        "c",
        "cmake",
        "cpp",
        "diff",
        "dockerfile",
        "git_config",
        "git_rebase",
        "gitcommit",
        "kconfig",
        "linkerscript",
        "lua",
        "markdown",
        "markdown_inline",
        "meson",
        "python",
        "rst",
        "rust",
        "udev",
        "yaml",
        "zig",
      },
    },
    config = function(_, opts)
      local TS = require("nvim-treesitter")
      TS.install(opts.ensure_installed)

      vim.api.nvim_create_autocmd("FileType", {
        group = vim.api.nvim_create_augroup("treesitter.setup", {}),
        callback = function(args)
          local buf = args.buf
          local filetype = args.match

          -- you need some mechanism to avoid running on buffers that do not
          -- correspond to a language (like oil.nvim buffers), this implementation
          -- checks if a parser exists for the current language
          local language = vim.treesitter.language.get_lang(filetype) or filetype
          if not vim.treesitter.language.add(language) then
            return
          end

          -- replicate `fold = { enable = true }`
          -- vim.wo.foldmethod = "expr"
          -- vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"

          -- replicate `highlight = { enable = true }`
          vim.treesitter.start(buf, language)

          -- replicate `indent = { enable = true }`
          vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

          -- `incremental_selection = { enable = true }` cannot be easily replicated
        end,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
     config = function()
       vim.lsp.config.clangd = {
         cmd = {
           "clangd",
           "--background-index",
           "--clang-tidy",
           "--header-insertion=iwyu",
           "--completion-style=detailed",
           "--function-arg-placeholders",
           "--fallback-style=llvm",
         }
       }

       vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
       vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
       vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
       vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { desc = "Go to Implementation" })
       vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
       -- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename Symbol" })
       vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Symbol References" })
       -- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
       vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to Next Diagnostic" })
       vim.keymap.set("n", "gl", vim.diagnostic.open_float, { desc = "Open Diagnostic Float" })
       vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to Previous Diagnostic" })
       vim.keymap.set("n", "<C-d>", vim.diagnostic.setloclist, { desc = "Diagnostic to local list" })

       vim.lsp.enable({'bashls', 'clangd', 'rust_analyzer'})
       vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
     end,
  },
  {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
      -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
      -- 'super-tab' for mappings similar to vscode (tab to accept)
      -- 'enter' for enter to accept
      -- 'none' for no mappings
      --
      -- All presets have the following mappings:
      -- C-space: Open menu or open docs if already open
      -- C-n/C-p or Up/Down: Select next/previous item
      -- C-e: Hide menu
      -- C-k: Toggle signature help (if signature.enabled = true)
      --
      -- See :h blink-cmp-config-keymap for defining your own keymap
      keymap = { preset = 'enter' },

      appearance = {
        nerd_font_variant = 'mono'
      },

      completion = { documentation = { auto_show = true } },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
      },

      -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
      -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
      -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
      fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" }
  },
}
