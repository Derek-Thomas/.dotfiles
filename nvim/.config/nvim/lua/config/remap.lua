local builtin = require('telescope.builtin')
vim.g.mapleader = " "
-- <leader>p is the "project" prefix (pv/pf/ps). System-clipboard paste lives on
-- <leader>P so it doesn't shadow that prefix and stall each one for 'timeoutlen'.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>P", '"+p')
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
