return {
  -- Vim surround
  {
    "tpope/vim-surround",
    event = "VeryLazy",
  },

  -- Vim eunuch - Unix helpers
  {
    "tpope/vim-eunuch",
    cmd = { "Remove", "Delete", "Move", "Rename", "Chmod", "Mkdir", "SudoWrite", "SudoEdit" },
  },

  -- Vim QF - Quickfix enhancements
  {
    "romainl/vim-qf",
    ft = "qf",
  },

  -- OSCYank - SSH clipboard
  {
    "ojroques/vim-oscyank",
    event = "VeryLazy",
  },

  -- Buffer tree
  {
    "el-iot/buffer-tree",
    cmd = "BufferTree",
  },

  -- Language-specific plugins
  {
    "nelsyeung/twig.vim",
    ft = "twig",
  },

  {
    "fatih/vim-go",
    ft = "go",
    build = ":GoUpdateBinaries",
  },

  {
    "rust-lang/rust.vim",
    ft = "rust",
  },
}
