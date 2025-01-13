return {
    -- I never comment but whatever
    {
        "folke/ts-comments.nvim",
        event = "VeryLazy",
        opts = {},
    },
    {
        "kylechui/nvim-surround",
        keys = { "cs", "ds", "ys", { "S", mode = "x" } },
        opts = {},
    },
    {
        "altermo/ultimate-autopair.nvim",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {},
    },
    {
        "nmac427/guess-indent.nvim",
        event = "BufReadPre",
        opts = {},
    },
}

