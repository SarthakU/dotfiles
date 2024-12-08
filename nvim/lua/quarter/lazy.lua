require("lazy").setup({
  "folke/which-key.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },
  "folke/neodev.nvim",
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim",    name = "catppuccin", priority = 1000 },
  {
    "nvim-treesitter/nvim-treesitter",
    bdependenciesuild = ":TSUpdate",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
  },
  {
    "supermaven-inc/supermaven-nvim",
  },
  {
    'echasnovski/mini.nvim'
  },
  { 'folke/todo-comments.nvim',         event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons',            enabled = vim.g.have_nerd_font },
    }
  },
  {
    "nvim-lua/popup.nvim"
  },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  {
    'mfussenegger/nvim-lint',
    event = {
      "BufReadPre",
      "BufNewFile"
    }
  },
  { "saadparwaiz1/cmp_luasnip" },
  { "L3MON4D3/LuaSnip" },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opts = true }
  },
  { "ThePrimeagen/harpoon" },
  -- { "zbirenbaum/copilot.lua" },
  {
    "j-hui/fidget.nvim",
    tag = "legacy",
    event = "LspAttach",
    opts = {
      -- options
    },
  },
  { "mbbill/undotree" },
  { "tpope/vim-fugitive" },
  { "NvChad/nvim-colorizer.lua" },
  {
    'stevearc/conform.nvim',
    opts = {},
  },
  {
    'tamton-aquib/duck.nvim',
  },
  {
    'onsails/lspkind.nvim',
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,
  }
})
