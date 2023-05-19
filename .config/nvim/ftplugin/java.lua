vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.cmdheight = 2

local status, jdtls = pcall(require, "jdtls")
if not status then
	return
end

-- Determine OS
local home = os.getenv("HOME")
if vim.fn.has("mac") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "/config_mac/"
elseif vim.fn.has("unix") == 1 then
	WORKSPACE_PATH = home .. "/workspace/"
	CONFIG = "/config_linux/"
else
	print("Unsupported system")
end

local jdtls_installation_path = home .. "/.config/jdtls/"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = WORKSPACE_PATH .. project_name
local java_dap = home .. "/.config/nvim/java-debug/com.microsoft.java.debug.plugin/target/"
local vscode_java_test = home .. "/.config/nvim/vscode-java-test/server/"

-- Find root of project
local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
local root_dir = require("jdtls.setup").find_root(root_markers)
if root_dir == "" then
	return
end

local extendedClientCapabilities = jdtls.extendedClientCapabilities
extendedClientCapabilities.resolveAdditionalTextEditsSupport = true

local config = {
	cmd = {
		"java",
		"-Declipse.application=org.eclipse.jdt.ls.core.id1",
		"-Dosgi.bundles.defaultStartLevel=4",
		"-Declipse.product=org.eclipse.jdt.ls.core.product",
		"-Dlog.protocol=true",
		"-Dlog.level=ALL",
		"-Xmx1g",
		"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
		"--add-modules=ALL-SYSTEM",
		"--add-opens",
		"java.base/java.util=ALL-UNNAMED",
		"--add-opens",
		"java.base/java.lang=ALL-UNNAMED",
		"-jar",
		jdtls_installation_path .. "/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar",
		"-configuration",
		jdtls_installation_path .. CONFIG,
		"-data",
		workspace_dir,
	},
	flags = {
		debounce_text_changes = 150,
		allow_incremental_sync = true,
	},
	handlers = {},

	contentProvider = { preferred = "fernflower" },
	on_init = on_init,
	init_options = {
		bundles = {
			vim.fn.glob(java_dap .. "com.microsoft.java.debug.plugin-0.45.0.jar", 1),
			vim.fn.glob(vscode_java_test .. "*.jar", 1),
		},
		extendedClientCapabilities = extendedClientCapabilities,
	},

	settings = {
		java = {
			signatureHelp = { enabled = true },
			runtimes = {
				{
					name = "JavaSE-17",
					path = "/usr/lib/jvm/jdk-17/",
				},
			},
		},
	},
	eclipse = {
		downloadSources = true,
	},
	maven = {
		downloadSources = true,
	},
	implementationsCodeLens = {
		enabled = true,
	},
	referencesCodeLens = {
		enabled = true,
	},
	references = {
		includeDecompiledSources = true,
	},
	inlayHints = {
		parameterNames = {
			enabled = "all", -- literals, all, none
		},
	},
	completion = {
		favoriteStaticMembers = {
			"org.hamcrest.MatcherAssert.assertThat",
			"org.hamcrest.Matchers.*",
			"org.hamcrest.CoreMatchers.*",
			"org.junit.jupiter.api.Assertions.*",
			"java.util.Objects.requireNonNull",
			"java.util.Objects.requireNonNullElse",
			"org.mockito.Mockito.*",
		},
	},
	sources = {
		organizeImports = {
			starThreshold = 9999,
			staticStarThreshold = 9999,
		},
	},
	codeGeneration = {
		toString = {
			template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
		},
		useBlocks = true,
	},
}

-- Test
config["on_attach"] = function(client, bufnr)
	require("jdtls").setup_dap({ hotcodereplace = "auto" })
end

-- Debug
local keymap = vim.keymap.set

keymap("n", "A-o", ":lua require'jdtls'.organize_imports()<cr>", { silent = true })
keymap("n", "crv", ":lua require'jdtls'.extract_variable()<cr>", { silent = true })
keymap("v", "crv", "<Esc>:lua require'jdtls'.extract_variable(true)<cr>", { silent = true })
keymap("n", "crc", ":lua require'jdtls'.extract_constant()<cr>", { silent = true })
keymap("v", "crc", "<Esc>:lua require'jdtls'.extract_constant(true)<cr>", { silent = true })
keymap("v", "crm", "<Esc>:lua require'jdtls'.extract_method(true)<cr>", { silent = true })

vim.cmd([[
command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_compile JdtCompile lua require('jdtls').compile(<f-args>)
command! -buffer -nargs=? -complete=custom,v:lua.require'jdtls'._complete_set_runtime JdtSetRuntime lua require('jdtls').set_runtime(<f-args>)
command! -buffer JdtUpdateConfig lua require('jdtls').update_project_config()
command! -buffer JdtJol lua require('jdtls').jol()
command! -buffer JdtBytecode lua require('jdtls').javap()
command! -buffer JdtJshell lua require('jdtls').jshell()
]])

require("jdtls").start_or_attach(config)
