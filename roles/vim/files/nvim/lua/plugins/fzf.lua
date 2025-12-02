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

      -- Create user commands (equivalent to old vimrc commands)
      vim.api.nvim_create_user_command("Rg", function()
        require("fzf-lua").live_grep()
      end, {})

      vim.api.nvim_create_user_command("Rgr", function()
        require("fzf-lua").live_grep_resume()
      end, {})

      vim.api.nvim_create_user_command("Files", function()
        require("fzf-lua").files()
      end, {})

      vim.api.nvim_create_user_command("History", function()
        require("fzf-lua").oldfiles()
      end, {})

      vim.api.nvim_create_user_command("Buffers", function()
        require("fzf-lua").buffers()
      end, {})
    end,
  },

  -- Nvim FZF
  {
    "vijaymarupudi/nvim-fzf",
    lazy = true,
  },
}
