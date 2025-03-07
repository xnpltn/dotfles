local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"
local servers = { "html", "cssls", "lua_ls" }
local on_attch_format = require("lsp-format").on_attach

local function combined_on_attach(client, bufnr)
  on_attach(client, bufnr)
  on_attch_format(client, bufnr)
end


--go
lspconfig.gopls.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotempl" },
  root_dir = util.root_pattern("go.work", "go.mod", "go.sum", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      -- usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
      gofumpt = true,
      staticcheck = true,
    }
  }
}

-- sql
lspconfig.sqls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  on_init = on_init,
}

-- vlang
lspconfig.v_analyzer.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
}

-- templ
lspconfig.templ.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
}

--python
lspconfig.pyright.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    pyright = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
}

-- mdx
lspconfig.mdx_analyzer.setup {}
-- vue
lspconfig.volar.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
  filetypes = { "vue", "typescript", "javascript", },
  settings = {
    volar = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}


-- svelte

lspconfig.svelte.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    svelte = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}

-- c and c++
-- lspconfig.clangd.setup {
--   on_attach = combined_on_attach,
--   capabilities = capabilities,
--   on_init = on_init,
--   filetypes = { "c", "cpp" },
--   settings = {
--     clangd = {
--       completeUnimported = true,
--       usePlaceholders = true,
--       analyses = {
--         unusedparams = true
--       }
--     }
--   }
-- }
-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = combined_on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end
-- rust_analyzer
lspconfig.rust_analyzer.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
  settings = {
    rust_analyzer = {
      usePlaceholders = true,
    }
  }
}

-- slint
lspconfig.slint_lsp.setup {
  on_attach = combined_on_attach,
  capabilities = capabilities,
  on_init = on_init,
  filetypes = { "slint" },
  cmd = { "slint-lsp" },
  root_dir = util.root_pattern("slint", "base.slint", "ui.slint", ".git"),
}

-- json
lspconfig.jsonls.setup {
  on_attach = combined_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  cmd = { "vscode-json-language-server", "--stdio" },
  filetypes = { "json", "jsonc" },
  init_options = { provideFormatter = true }
}

lspconfig.astro.setup {}
-- typescript
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
    '/node_modules/@vue/language-server'
lspconfig.ts_ls.setup {
  on_attach = combined_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript", "vue", "ts", "js" },
  init_options = {
    plugins = {
      {
        name = '@vue/typescript-plugin',
        location = vue_language_server_path,
        languages = { 'vue' },
      },
    },
  },
  settings = {
    tsserver = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  },
}

lspconfig.tailwindcss.setup({
  on_attach = combined_on_attach,
  capabilities = capabilities,
  init_options = { userLanguages = { templ = "html" } },
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(([^)]*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(([^)]*)\\)",  "(?:'|\"|`)([^']*)(?:'|\"|`)" }
        },
      },
    },
  },
})

-- v-lang
lspconfig.vls.setup {
  on_attach = combined_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    vls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  },
}

-- zig
lspconfig.zls.setup {
  on_attach = combined_on_attach,
  on_init = on_init,
  capabilities = capabilities,
  settings = {
    zls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  },
}


lspconfig.prismals.setup {}
