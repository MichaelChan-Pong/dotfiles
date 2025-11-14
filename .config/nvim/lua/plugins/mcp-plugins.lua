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
      { "<c-h>", vim.cmd.TmuxNavigateLeft },
      { "<c-j>", vim.cmd.TmuxNavigateDown },
      { "<c-k>", vim.cmd.TmuxNavigateUp },
      { "<c-l>", vim.cmd.TmuxNavigateRight },
    },
  },
  {
    "mbbill/undotree",
    cmd = {
      "UndotreeToggle",
    },
    keys = {
      { "<Leader>u", vim.cmd.UndotreeToggle },
    },
  },

  -- Modify existing plugins
  {
    "ahmedkhalf/project.nvim",
    opts = {
      manual_mode = false,
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
  -- {
  --   "zbirenbaum/copilot.lua",
  --   opts = {
  --     -- suggestion = {
  --     --   auto_trigger = false
  --     -- }
  --     copilot_model = "gpt-4o-copilot"
  --   }
  -- },
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
    },
    keys = {
    {
      "<leader>am",
      function()
        return require("CopilotChat").select_model()
      end,
      desc = "Select Model (CopilotChat)",
      mode = { "n", "v" },
    },
    }
  },
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>n", false},
      { "<leader>N", false},
      { "<leader>h", function() Snacks.notifier.show_history() end, desc = "Notification History" },
      { "<leader>H", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
      { "<C-p>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "<leader>g/", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<C-b>", function() Snacks.picker.buffers() end, desc = "Buffers" },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
      "s1n7ax/nvim-window-picker",
      config = function()
        require("window-picker").setup()
      end,
    },
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
    "michaelrommel/nvim-silicon",
    -- commit = "9fe6001dc8cad4d9c53bcfc8649e3dc76ffa169c",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",
    opts = {
      background = "#00C7FD",
      -- From https://github.com/folke/tokyonight.nvim/blob/main/extras/sublime/tokyonight_night.tmTheme
      theme = "/home/mcp/.config/silicon/themes/tokyonight_night.tmTheme",
      line_offset = function(args)
        return args.line1
      end,
      to_clipboard = true,
      wslclipboard = "always",
      wslclipboardcopy = "delete",
      -- language = function()
      --   if vim.bo.filetype == "bicep" then
      --     return "json"
      --   end
      --   return vim.bo.filetype
      -- end,
      window_title = function()
        return vim.fn.fnamemodify(
          vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
          ":t"
        )
      end,
    },
    keys = {
      { "<leader>cs", function() require("nvim-silicon").clip() end, desc = "Copy code screenshot to clipboard", mode = { "v" } }
    },
  },
  {
    "danymat/neogen",
    opts = {
      languages = {
        cs = {
            template = {
                annotation_convention = "xmldoc"
                }
        },
    }
    }
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = {
          cmd = {
            "OmniSharp",
            "-z",
            "--hostPID",
            tostring(vim.fn.getpid()),
            "DotNet:enablePackageRestore=false",
            "--encoding",
            "utf-8",
            "--languageserver",
          },
        },
      },
    },
  };
}
