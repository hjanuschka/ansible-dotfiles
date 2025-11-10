return {
  -- FZF
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },

  -- FZF Lua - Fuzzy finder
  {
    "ibhagwan/fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<C-p>", "<cmd>FzfLua git_files<CR>", desc = "Find git files" },
      { "<C-x>", "<cmd>FzfLua buffers<CR>", desc = "Find buffers" },
      { "<Leader>r", "<cmd>FzfLua resume<CR>", desc = "Resume FZF" },
      { "<C-o>", "<cmd>Rgr<CR>", desc = "Grep" },
    },
    config = function()
      -- Set FZF binary path explicitly
      vim.env.PATH = vim.env.HOME .. "/.fzf/bin:" .. vim.env.PATH
      require("fzf-lua").setup({})
    end,
  },

  -- Nvim FZF
  {
    "vijaymarupudi/nvim-fzf",
    lazy = true,
  },
}
