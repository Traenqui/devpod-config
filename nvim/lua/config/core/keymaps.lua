vim.g.mapleader = " "
vim.g.localmapleader = ","

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("n", "ü", "[", {remap = true})

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })
vim.keymap.set('x', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true, desc = "Down" })

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })
vim.keymap.set('x', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true, desc = "Up" })

vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode with kj" })

vim.keymap.set("n", "-", "<cmd>Oil --float<CR>", { desc = "Open Filenavigator", silent = true })

vim.keymap.set("n", "<S-Tab>", ":normal zs<CR>", { noremap = true, silent = true, desc = "edit: Toggle code fold" })
vim.keymap.set("n", "Y", "y$", { noremap = true, silent = true, desc = "edit: Yank text to EOL" })
vim.keymap.set("n", "D", "d$", { noremap = true, silent = true, desc = "edit: Delete text to EOL" })
vim.keymap.set("n", "n", "nzzzv", { noremap = true, silent = true, desc = "edit: Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { noremap = true, silent = true, desc = "edit: Prev search result" })
vim.keymap.set("n", "<BS>", "^", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "edit: Clear search highlights" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "edit: Move this line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "edit: Move this line down" })

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to Left Window", remap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to Right Window", remap = true })

vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })


vim.keymap.set("n", "<leader>st", "<cmd>TodoFzfLua<CR>", {desc = "Todo" })
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

