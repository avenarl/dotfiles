require("nvim-lsp-installer").setup({
	ensure_installed = { "jdtls" },
	automatic_installation = { exclude = { "jdtls" } },
})
