vim.filetype.add({
    extension = {
        templ = "templ",
    },
})

require 'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "json" },
  ignore_install = {},
  modules = {},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024   -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = {
      "templ"
    },
    context_commentstring = {
      enable = true,
    },
  },
}

vim.treesitter.language.register("json", "swcrc")
-- require('nvim-treesitter.configs').setup {
--   -- Add languages to be installed here that you want installed for treesitter
--   ensure_installed = { 'c', 'cpp', 'go', 'lua', 'python', 'rust', 'tsx', 'typescript', 'vimdoc', 'vim' },
--
--   -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
--   auto_install = false,
--
--   highlight = { enable = true },
--   indent = { enable = true },
--   incremental_selection = {
--     enable = true,
--     keymaps = {
--       init_selection = '<c-space>',
--       node_incremental = '<c-space>',
--       scope_incremental = '<c-s>',
--       node_decremental = '<M-space>',
--     },
--   },
--   textobjects = {
--     select = {
--       enable = true,
--       lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--       keymaps = {
--         -- You can use the capture groups defined in textobjects.scm
--         ['aa'] = '@parameter.outer',
--         ['ia'] = '@parameter.inner',
--         ['af'] = '@function.outer',
--         ['if'] = '@function.inner',
--         ['ac'] = '@class.outer',
--         ['ic'] = '@class.inner',
--       },
--     },
--     move = {
--       enable = true,
--       set_jumps = true, -- whether to set jumps in the jumplist
--       goto_next_start = {
--         [']m'] = '@function.outer',
--         [']]'] = '@class.outer',
--       },
--       goto_next_end = {
--         [']M'] = '@function.outer',
--         [']['] = '@class.outer',
--       },
--       goto_previous_start = {
--         ['[m'] = '@function.outer',
--         ['[['] = '@class.outer',
--       },
--       goto_previous_end = {
--         ['[M'] = '@function.outer',
--         ['[]'] = '@class.outer',
--       },
--     },
--     swap = {
--       enable = true,
--       swap_next = {
--         ['<leader>a'] = '@parameter.inner',
--       },
--       swap_previous = {
--         ['<leader>A'] = '@parameter.inner',
--       },
--     },
--   },
--}
--
-- require 'treesitter-context'.setup {
--   enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
--   max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
--   trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
--   min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
--   patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
--     -- For all filetypes
--     -- Note that setting an entry here replaces all other patterns for this entry.
--     -- By setting the 'default' entry below, you can control which nodes you want to
--     -- appear in the context window.
--     default = {
--       'class',
--       'function',
--       'method',
--       'for',
--       'while',
--       'if',
--       'switch',
--       'case',
--       'interface',
--       'struct',
--       'enum',
--     },
--     -- Patterns for specific filetypes
--     -- If a pattern is missing, *open a PR* so everyone can benefit.
--     tex = {
--       'chapter',
--       'section',
--       'subsection',
--       'subsubsection',
--     },
--     haskell = {
--       'adt'
--     },
--     rust = {
--       'impl_item',
--
--     },
--     terraform = {
--       'block',
--       'object_elem',
--       'attribute',
--     },
--     scala = {
--       'object_definition',
--     },
--     vhdl = {
--       'process_statement',
--       'architecture_body',
--       'entity_declaration',
--     },
--     markdown = {
--       'section',
--     },
--     elixir = {
--       'anonymous_function',
--       'arguments',
--       'block',
--       'do_block',
--       'list',
--       'map',
--       'tuple',
--       'quoted_content',
--     },
--     json = {
--       'pair',
--     },
--     typescript = {
--       'export_statement',
--     },
--     yaml = {
--       'block_mapping_pair',
--     },
--   },
--   exact_patterns = {
--     -- Example for a specific filetype with Lua patterns
--     -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
--     -- exactly match "impl_item" only)
--     -- rust = true,
--   },
--
--   -- [!] The options below are exposed but shouldn't require your attention,
--   --     you can safely ignore them.
--
--   zindex = 20, -- The Z-index of the context window
--   mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
--   -- Separator between context and content. Should be a single character string, like '-'.
--   -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
--   separator = nil,
-- }
