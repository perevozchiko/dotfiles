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

  -- Hop - simple and intuitive navigation with labels
  {
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("hop").setup({
        keys = "asdfghjkl;qwertyuiopzxcvbnm",
        jump_on_sole_occurrence = true,
        create_hl_autocmd = true,
      })
      
      -- Simple and intuitive keymaps
      vim.keymap.set("n", "f", "<cmd>HopChar1<CR>", { desc = "Hop to character" })
      vim.keymap.set("n", "F", "<cmd>HopChar1BC<CR>", { desc = "Hop to character backward" })
      vim.keymap.set("n", "t", "<cmd>HopChar1CurrentLineAC<CR>", { desc = "Hop till character" })
      vim.keymap.set("n", "T", "<cmd>HopChar1CurrentLineBC<CR>", { desc = "Hop till character backward" })
      vim.keymap.set("n", "gw", "<cmd>HopWord<CR>", { desc = "Hop to word" })
      vim.keymap.set("n", "gl", "<cmd>HopLine<CR>", { desc = "Hop to line" })
      vim.keymap.set("n", "gp", "<cmd>HopPattern<CR>", { desc = "Hop to pattern" })
      
      -- Visual mode
      vim.keymap.set("v", "f", "<cmd>HopChar1<CR>", { desc = "Hop to character" })
      vim.keymap.set("v", "F", "<cmd>HopChar1BC<CR>", { desc = "Hop to character backward" })
      vim.keymap.set("v", "gw", "<cmd>HopWord<CR>", { desc = "Hop to word" })
    end,
  },
}



