return {
  -- Add new plugins
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   cmd = {
  --     "NvimTreeToggle",
  --   },
  --   config = function()
  --     require("nvim-tree").setup({
  --       diagnostics = {
  --         enable = true,
  --         show_on_dirs = true,
  --       },
  --       view = {
  --         width = 40,
  --         side = "left",
  --       },
  --       sync_root_with_cwd = true,
  --       respect_buf_cwd = true,
  --       update_focused_file = {
  --         enable = true,
  --         update_root = true,
  --       },
  --     })
  --   end,
  --   keys = {
  --     {
  --       "<Leader>n",
  --       function()
  --         vim.cmd([[NvimTreeToggle]])
  --       end,
  --       mode = { "n", "t" },
  --       desc = "Toggle nvim-tree",
  --     },
  --   },
  -- },

  -- Modify existing plugins
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    config = function()
      require("telescope").setup{
        defaults = {
          vimgrep_arguments = {
            "rg",
            "--follow",        -- Follow symbolic links
            "--hidden",        -- Search for hidden files
            "--no-heading",    -- Don't group matches by each file
            "--with-filename", -- Print the file path with the matched lines
            "--line-number",   -- Show line numbers
            "--column",        -- Show column numbers
            "--smart-case",    -- Smart case search

            -- Exclude some patterns from search
            "--glob=!**/.git/*",
            "--glob=!**/.idea/*",
            "--glob=!**/.vscode/*",
            "--glob=!**/build/*",
            "--glob=!**/dist/*",
            "--glob=!**/yarn.lock",
            "--glob=!**/package-lock.json",
          }
        },
        pickers = {
          find_files = {
            hidden = true,
            -- needed to exclude some files & dirs from general search
            -- when not included or specified in .gitignore
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--glob=!**/.git/*",
              "--glob=!**/.idea/*",
              "--glob=!**/.vscode/*",
              "--glob=!**/build/*",
              "--glob=!**/dist/*",
              "--glob=!**/yarn.lock",
              "--glob=!**/package-lock.json",
            },
          },
        },
      }
    end,
    keys = {
      {
        "<C-p>",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
      {
        "<Leader>g",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Find text in project",
      },
      {
        "<C-b>",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Find text in project",
      },
      {
        "gr",
        function()
          require("telescope.builtin").lsp_references()
        end,
        desc = "Find text in project",
      },
      {
        "gd",
        function()
          require("telescope.builtin").lsp_definitions()
        end,
        desc = "Find text in project",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    opts = {
      options = {
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        mode = "tabs",
        show_close_icon = false,
        sort_by = "tabs",
        separator_style = "slant",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        }
      },
    },
    keys = {
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Explorer NeoTree (Root Dir)",
      },
      {
        "<leader>fE",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>n", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>N", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git Explorer",
      },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = {
      mappings = {
        -- Reset the chat buffer
        reset = {
          normal = "<C-x>",
          insert = "<C-x>",
        },
      }
    }
  },
}
