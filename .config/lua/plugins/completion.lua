return {

    {
      'saghen/blink.cmp',
      -- optional: provides snippets for the snippet source
      dependencies = 'rafamadriz/friendly-snippets',

      event = { "InsertEnter", "CmdlineEnter" }, 

      -- use a release tag to download pre-built binaries
      version = '*',
      -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
      -- build = 'cargo build --release',
      -- If you use nix, you can build from source using latest nightly rust with:
      -- build = 'nix run .#build-plugin',

      ---@module 'blink.cmp'
      ---@type blink.cmp.Config
      opts = {
        -- 'default' for mappings similar to built-in completion
        -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
        -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
        -- See the full "keymap" documentation for information on defining your own keymap.
        keymap = {
            preset = "none",
            -- accept
            ["<C-Space>"] = { "select_and_accept", "show" },
            ["<C-c>"] = { "cancel", "fallback" },
            -- select
            ["<C-n>"] = { "show", "select_next" },
            ["<C-p>"] = { "show", "select_prev" },
            ["<Down>"] = { "show", "select_next" },
            ["<Up>"] = { "show", "select_prev" },
            -- snippet
            ["<Tab>"] = { "snippet_forward", "fallback" },
            ["<S-Tab>"] = { "snippet_backward", "fallback" },
            ["<Left>"] = { "snippet_backward" },
            ["<Right>"] = { "snippet_forward" },
            -- documentation
            ["<C-u>"] = {
                "show_documentation",
                "scroll_documentation_up",
                "fallback",
            },
            ["<C-d>"] = {
                "show_documentation",
                "scroll_documentation_down",
                "fallback",
            },
            cmdline = {
                preset = "none",
                ["<C-Space>"] = { "show", "select_and_accept" },
                ["<C-c>"] = { "cancel", "fallback" },
                ["<Tab>"] = { "show", "select_next" },
                ["<S-Tab>"] = { "show", "select_prev" },
            },
        },

        appearance = {
          -- Sets the fallback highlight groups to nvim-cmp's highlight groups
          -- Useful for when your theme doesn't support blink.cmp
          -- Will be removed in a future release
          use_nvim_cmp_as_default = true,
          -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
          -- Adjusts spacing to ensure icons are aligned
          nerd_font_variant = 'mono',
          kind_icons = vim.g.lsp_kind,
        },

        signature = { enabled = true }, 

        completion = {
            keyword = { range = "full" },
            trigger = { prefetch_on_insert = true },
            list = {
                max_items = 40,

                selection = {
                    preselect = function(ctx)
                        return ctx.mode == "cmdline" and "auto_insert"
                            or "preselect"
                    end,
                },
            },
            menu = {
                auto_show = function(ctx, _)
                   return ctx.trigger.kind ~= "keyword" or ctx.bounds.length >= 3
                end,
                draw = {
                    -- FIX(upstream): LATER: exclude label details
                    columns = { { "label" }, { "kind_icon" } },
                },
            },
            documentation = { 
                window = { border = "solid" }, 
                auto_show = true, 
                auto_show_delay_ms = 500,
            }, 
            ghost_text = { enabled = true },
        },

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
          default = { 'lsp', 'path', 'snippets', 'buffer' },
        },
      },
      opts_extend = { "sources.default" }
    }
}
