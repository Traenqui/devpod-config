return {
	"stevearc/oil.nvim",
    -- enabled = false,
	dependencies = { {"echasnovski/mini.icons", opts = {}  }},
	config = function()
		require("oil").setup({
            default_file_explorer = true, -- start up nvim with oil instead of netrw
			keymaps = {
				["<C-h>"] = false,
                ["<C-c>"] = false, -- prevent from closing Oil as <C-c> is esc key
				["<M-h>"] = "actions.select_split",
                ["q"] = "actions.close",
			},
            delete_to_trash = true,
			view_options = {
				show_hidden = true,
			},
            skip_confirm_for_simple_edits = true,
		})

		-- opens parent dir over current active window
		vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })

       vim.api.nvim_create_autocmd("FileType", {
            pattern = "oil", -- Adjust if Oil uses a specific file type identifier
            callback = function()
                vim.opt_local.cursorline = true
            end,
        })
	end,

}
