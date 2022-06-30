require'lspconfig'.gopls.setup{}
--require'lualine'.setup()
require'lspconfig'.eslint.setup{
	cmd = {'/usr/local/bin/vscode-eslint-language-server', '--stdio'}
}
require'lspconfig'.intelephense.setup{}
require'lspconfig'.volar.setup{
  	filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
	init_options = {
		typescript = {
			serverPath = '/Users/Anders/.config/yarn/global/node_modules/typescript/lib/tsserverlibrary.js'
		}
	}
}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.golangci_lint_ls.setup{}
