return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	url = "https://github.com/nvim-treesitter/nvim-treesitter.git",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {"c", "javascript", "c_sharp", "lua", "query", "markdown", "php","markdown_inline"},
			sync_install = false,
			auto_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false
			}
		}
	end,
}
