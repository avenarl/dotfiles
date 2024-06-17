require("nvim-lsp-installer").init({
	ensure_installed = { "jdtls" },
	automatic_installation = { exclude = { "jdtls" } },
})
