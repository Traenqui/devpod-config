return {
        "folke/todo-comments.nvim",
            dependencies = {"nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TodoTrouble", "TodoFzfLua" },
    opts = {},
        keys = {
            { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
            { "[t", function() require("todo-comments").jump_prev() end, desc = "Prev todo comment" },
        },
}
