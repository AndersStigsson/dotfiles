local lspServers = {
    'gopls',
    'golangci_lint_ls',
    'jsonls',
    'tsserver',
    'volar',
    'eslint',
    'intelephense',
    'sumneko_lua',
    'dockerls',
    'bashls',
    'sqls',
    'lemminx',
}

require("nvim-lsp-installer").setup {
    automatic_installation = true,
    -- 'intelephense', 
    ensure_installed = lspServers,
    ui = {
        icons = {
            server_installed = "?",
            server_pending = "?",
            server_uninstalled = "?"
        }
    }
}

lspconfig = require("lspconfig")
lspconfig_configs = require('lspconfig/configs')
lspconfig_util = require('lspconfig/util')

-- -- Mappings.
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.o.updatetime = 200

local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format()<CR>', opts)
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            local opts = {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                border = 'rounded',
                source = 'always',
                prefix = ' ',
                noremap = true,
                silent = true,
            }
            vim.diagnostic.open_float(nil, opts)
        end
    })
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()
for _, lsp in pairs(lspServers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    if lsp == 'intelephense' then
        opts.settings = {
            intelephense = {
                files = {
                    maxSize = 10000000;
                };
            };
        }
    end
    if lsp == 'volar' then
         --lspconfig_configs.volar_api = {
         --           default_config: vim.tbl_extend('force',
         --           lspconfig.volar.document_config.default_config, {
         --               filetypes: { 'vue' },
         --               init_options: {
         --                   typescript: {
         --                       serverPath: ''
         --                   },
         --                   languageFeatures: {
         --                       implementation: true, -- new in @volar/vue-language-server v0.33
         --                       references: true,
         --                       definition: true,
         --                       typeDefinition: true,
         --                       callHierarchy: true,
         --                       hover: true,
         --                       rename: true,
         --                       renameFileRefactoring: true,
         --                       signatureHelp: true,
         --                       codeAction: true,
         --                       workspaceSymbol: true,
         --                       completion: {
         --                           defaultTagNameCase: 'both',
         --                           defaultAttrNameCase: 'kebabCase',
         --                           getDocumentNameCasesRequest: false,
         --                           getDocumentSelectionRequest: false,
         --                       },
         --                   }
         --               },
         --           })
         --       }

         --       lspconfig_configs.volar_doc = {
         --           default_config: vim.tbl_extend('force',
         --           lspconfig.volar.document_config.default_config, {
         --               filetypes: { 'vue' },
         --               init_options: {
         --                   typescript: {
         --                       serverPath: ''
         --                   },
         --               },
         --               languageFeatures: {
         --                   implementation: true, -- new in @volar/vue-language-server v0.33
         --                   documentHighlight: true,
         --                   documentLink: true,
         --                   codeLens: { showReferencesNotification: true},
         --                   -- not supported - https://github.com/neovim/neovim/pull/15723
         --                   semanticTokens: false,
         --                   diagnostics: true,
         --                   schemaRequestService: true,
         --               }
         --           })
         --       }

         --       lspconfig_configs.volar_html = {
         --           default_config: vim.tbl_extend('force',
         --           lspconfig.volar.document_config.default_config, {
         --               filetypes: { 'vue' },
         --               init_options: {
         --                   typescript: {
         --                       serverPath: ''
         --                   },
         --                   documentFeatures: {
         --                       selectionRange: true,
         --                       foldingRange: true,
         --                       linkedEditingRange: true,
         --                       documentSymbol: true,
         --                       -- not supported - https://github.com/neovim/neovim/pull/13654
         --                       documentColor: false,
         --                       documentFormatting: {
         --                           defaultPrintWidth: 100,
         --                       },
         --                   }
         --               },
         --           })
         --       }

         --       lspconfig.volar_api.setup(opts)
         --       lspconfig.volar_doc.setup(opts)
         --       lspconfig.volar_html.setup(opts)
        --        vim.cmd [[ do User LspAttachBuffers ]
    end
    require('lspconfig')[lsp].setup(opts)
end

vim.diagnostic.config({
    virtual_text = false,
    -- signs = true,
    underline = false,
    -- update_in_insert = false,
    -- severity_sort = false,
})
