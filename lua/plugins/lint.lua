require("lint").linters_by_ft = { -- nvim-lint setup
	lua = { "luac" },
	python = { "pylint" },
	sh = { "bash" },
	c = { "cppcheck" },
	rust = { "clippy" },
	css = { "stylelint" },
	html = { "htmlhint" },
}

require("conform").setup({ -- conform setup code formatting
	formatters_by_ft = {
		python = { "black" },
		cpp = { "clang-format" },
		c = { "clang-format" },
		lua = { "stylua" },
		json = { "jq" },
	},
})
