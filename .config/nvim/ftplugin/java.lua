local home = os.getenv("HOME")
local jdtls_installation_path = home .. "/.config/jdtls"
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspace_dir = home .. "/Projects/tweelon/" .. project_name
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
		jdtls_installation_path .. "/config_linux",
		"-data",
		workspace_dir,
	},
	flags = {
		debounce_text_changes = 150,
		allow_incremental_sync = true,
	},
	handlers = {},
	root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	contentProvider = { preferred = "fernflower" },
	on_init = on_init,
	init_options = {
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

local bundles = {
	vim.fn.glob(
		home .. ".config/nvim/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-*.jar",
		1
	),
}

require("jdtls").start_or_attach(config)
