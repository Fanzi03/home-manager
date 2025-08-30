''
	local harpoon = require("harpoon")

	harpoon:setup({
  		settings = {
    			save_on_toggle = false,
    			sync_on_ui_close = false,
  		}
	})

	vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
	vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

	vim.keymap.set("n", "<C-j>", function() harpoon:list():prev() end)
	vim.keymap.set("n", "<C-k>", function() harpoon:list():next() end)

''
