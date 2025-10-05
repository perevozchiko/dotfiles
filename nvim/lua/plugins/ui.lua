-- UI plugins for interface enhancement
return {
  -- Status line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "catppuccin",
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch", "diff", "diagnostics" },
          lualine_c = { "filename" },
          lualine_x = { "encoding", "fileformat", "filetype" },
          lualine_y = { "progress" },
          lualine_z = { "location" },
        },
      })
    end,
  },

  -- File icons
  {
    "nvim-tree/nvim-web-devicons",
    config = function()
      require("nvim-web-devicons").setup({
        default = true,
      })
    end,
  },

  -- File manager
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        sort_by = "case_sensitive",
        view = {
          width = 30,
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = false,
        },
        git = {
          enable = true,
        },
      })
      
      -- Hotkey for opening file manager
      vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true })
    end,
  },

  -- File search
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.4",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          prompt_prefix = " ",
          selection_caret = " ",
          path_display = { "truncate" },
          file_ignore_patterns = {
            "%.git/",
            "node_modules/",
            "%.o$",
            "%.a$",
            "%.so$",
          },
        },
      })
      
      -- Search hotkeys
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
  },

  -- Bracket pair highlighting
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },

  -- Code commenting
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  },

  -- Leap - fast navigation with labels
  {
    "ggandor/leap.nvim",
    config = function()
      require("leap").add_default_mappings()
      
      -- Custom keymaps for better experience
      vim.keymap.set("n", "s", "<Plug>(leap-forward-to)", { desc = "Leap forward to" })
      vim.keymap.set("n", "S", "<Plug>(leap-backward-to)", { desc = "Leap backward to" })
      vim.keymap.set("x", "s", "<Plug>(leap-forward-to)", { desc = "Leap forward to" })
      vim.keymap.set("x", "S", "<Plug>(leap-backward-to)", { desc = "Leap backward to" })
      vim.keymap.set("o", "s", "<Plug>(leap-forward-to)", { desc = "Leap forward to" })
      vim.keymap.set("o", "S", "<Plug>(leap-backward-to)", { desc = "Leap backward to" })
      
      -- Leap with line mode
      vim.keymap.set("n", "gs", "<Plug>(leap-forward-till)", { desc = "Leap forward till" })
      vim.keymap.set("n", "gS", "<Plug>(leap-backward-till)", { desc = "Leap backward till" })
      vim.keymap.set("x", "gs", "<Plug>(leap-forward-till)", { desc = "Leap forward till" })
      vim.keymap.set("x", "gS", "<Plug>(leap-backward-till)", { desc = "Leap backward till" })
      vim.keymap.set("o", "gs", "<Plug>(leap-forward-till)", { desc = "Leap forward till" })
      vim.keymap.set("o", "gS", "<Plug>(leap-backward-till)", { desc = "Leap backward till" })
    end,
  },
}



