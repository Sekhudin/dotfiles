return {
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },

  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local themes = require("telescope.themes")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "smart" },
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = { preview_width = 0.55 },
            width = 0.87,
            height = 0.80,
          },
        },
        pickers = {
          find_files = { hidden = true },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          },
          ["ui-select"] = themes.get_dropdown({}),
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")

      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "<C-p>", builtin.find_files, opts)
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, opts)
      vim.keymap.set("n", "<leader><leader>", builtin.oldfiles, opts)
      vim.keymap.set("n", "<leader>fb", builtin.buffers, opts)
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, opts)
      vim.keymap.set("n", "<leader>fk", builtin.keymaps, opts)
    end,
  },
}
