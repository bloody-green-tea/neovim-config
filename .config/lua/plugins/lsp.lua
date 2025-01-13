return {
    {
        "WieeRd/auto-lsp.nvim",
        dependencies = "neovim/nvim-lspconfig",
        event = "VeryLazy",
        opts = {
            ["*"] = {}
        },
    },
    {
        "RRethy/vim-illuminate",
        event = "VeryLazy",
        keys = {
          {
            "]r",
            function()
              require("illuminate").goto_next_reference()
            end,
            desc = "Next Reference",
          },
          {
            "[r",
            function()
              require("illuminate").goto_prev_reference()
            end,
            desc = "Prev Reference",
          },
        },
        opts = {
          providers = { "lsp", "treesitter" },
          delay = 50,
        },
        config = function(_, opts)
            require("illuminate").configure(opts)
        end,
    },
}
