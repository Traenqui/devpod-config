return {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    dependencies_bin = { ["tinymist"] = "tinymist" },
    config = function()
        require("typst-preview").setup({
            -- point at the fixed port you forwarded
            port = 38319,

            -- invoke the bind-mounted xdg-open inside the container
            open_cmd = "xdg-open %s",
        })
    end,
}
