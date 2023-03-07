local null_ls = require("null-ls")
null_ls.setup({
    debug = true,
    sources = {
        null_ls.builtins.diagnostics.phpstan.with({
            timeout = 30000,
            extra_args = {"--memory-limit=2G"},
        })
    },
})
