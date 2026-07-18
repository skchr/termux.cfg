return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  { "prjctimg/stoic.nvim", opts = {} },
  { "prjctimg/p5.nvim", opts = {} },

  {
    "allaman/emoji.nvim",
    version = "1.0.0",
    ft = "*",

    opts = {
      enable_cmp_integration = false,
      ui_select = true,
    },
    config = function()
      require("emoji").setup()
    end,
  },

  {
    "2kabhishek/nerdy.nvim",
    cmd = "Nerdy",
    opts = {
      max_recents = 30,
      add_default_keybindings = true,
    },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "asm",
        "rust",
        "javascript",
        "typescript",
        "odin",
        "wgsl",
        "glsl",
      },
    },
  },
}
