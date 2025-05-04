return {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "TodoTrouble", "TodoFzfLua" },
    opts = {},
}
