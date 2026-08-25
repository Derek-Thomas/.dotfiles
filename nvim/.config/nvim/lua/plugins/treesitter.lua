-- nvim-treesitter `main` branch (the rewrite).
--
-- The `master` branch was archived on 2025-05-24 and is incompatible with
-- Neovim 0.12: its custom query directives use the pre-0.11 signature, which
-- threw "attempt to call method 'range' (a nil value)" on every markdown
-- buffer containing a fenced code block.
--
-- `main` requires the tree-sitter CLI (>= 0.26.1) and a C compiler, and it
-- installs parsers + queries into `install_dir` rather than into the plugin
-- directory. It does NOT support lazy-loading.
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({
			"c",
			"c_sharp",
			"javascript",
			"lua",
			"markdown",
			"markdown_inline",
			"php",
			"query",
		})

		-- `main` no longer enables highlighting for you -- Neovim owns it now.
		-- Start it per-buffer, but only when a parser is actually available, so
		-- filetypes without one don't raise an error.
		vim.api.nvim_create_autocmd("FileType", {
			desc = "Enable treesitter highlighting where a parser exists",
			callback = function(ev)
				local lang = vim.treesitter.language.get_lang(ev.match)
				if lang and vim.treesitter.language.add(lang) then
					vim.treesitter.start(ev.buf, lang)
				end
			end,
		})
	end,
}
