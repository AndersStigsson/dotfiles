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

lspconfig = require "lspconfig"
util = require "lspconfig/util"

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
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
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


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)
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
    require('lspconfig')[lsp].setup(opts)
end

vim.diagnostic.config({
    virtual_text = false,
    -- signs = true,
    underline = false,
    -- update_in_insert = false,
    -- severity_sort = false,
})
