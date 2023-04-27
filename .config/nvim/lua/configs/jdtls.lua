local serverCommands = {
	java = {
		"~/.config/jdtls/plugins/org.eclipse.equinox.launcher_*.jar",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.level=ALL",
		"-noverify",
		"-Xmx1G",
		"-jar",
		"-Dfile.encoding=UTF-8",
		"-Duser.language=en",
		"-Duser.country=US",
		"-Duser.variant=US",
	},
}

require("lspconfig").jdtls.setup({
	cmd = serverCommands.java,
})
