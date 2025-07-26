-- don't do anything in non-vscode instances
if not vim.g.vscode then return {} end

-- a list of known working plugins with vscode-neovim, update with your own plugins
local plugins = {
  "lazy.nvim",
  "AstroNvim",
  "astrocore",
  "astroui",
  "Comment.nvim",
  "nvim-autopairs",
  "nvim-treesitter",
  "nvim-ts-autotag",
  "nvim-treesitter-textobjects",
  "nvim-ts-context-commentstring",
  "vscode-multi-cursor.nvim",
  "hop.nvim",
  "nvim-surround",
}
local vscode = require "vscode"
local Config = require "lazy.core.config"
-- disable plugin update checking
Config.options.checker.enabled = false
Config.options.change_detection.enabled = false
-- replace the default `cond`
Config.options.defaults.cond = function(plugin) return vim.tbl_contains(plugins, plugin.name) end
vim.notify = vscode.notify
---@type LazySpec
return {
  -- add a few keybindings
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        n = {
          ["t"] = function() vscode.call "workbench.action.terminal.focus" end,
          ["\\"] = function() vscode.call "workbench.action.splitEditorRight" end,
          ["|"] = function() vscode.call "workbench.action.splitEditorDown" end,
          ["_"] = "$",
          ["<leader>a"] = function() vscode.call "editor.action.selectAll" end,
          ["<leader>b"] = function() vscode.call "workbench.action.showAllEditors" end,
          ["<Leader>q"] = "<CMD>Quit<CR>",
          ["<Leader>ff"] = "<CMD>Find<CR>",
          ["<Leader>fw"] = function() vscode.call "workbench.action.findInFiles" end,
          ["<Leader>e"] = function() vscode.call "workbench.files.action.focusOpenEditorsView" end,
          ["<leader>h"] = "<CMD>lua require('vscode').call('workbench.action.navigateBack')<CR>",
          ["<leader>l"] = "<CMD>lua require('vscode').call('workbench.action.navigateForward')<CR>",
          ["<Leader>ls"] = function() vscode.call "workbench.action.gotoSymbol" end,
          ["<Leader>o"] = function() vscode.call "workbench.files.action.focusFilesExplorer" end,
          ["<Leader>p"] = function() vscode.call "workbench.action.togglePanel" end,
          ["<Leader>z"] = function() vscode.call "workbench.action.toggleZenMode" end,
          ["<Leader>/"] = function() vscode.call "editor.action.commentLine" end,
          ["<Leader>gg"] = function()
            vscode.action(
              "workbench.action.terminal.newWithProfile",
              { args = { profileName = "lazygit", location = "editor" } }
            )
          end,
          ["<leader>,"] = "<CMD>normal A,<CR>",
          ["<leader>;"] = "<CMD>normal A;<CR>",
          ["gi"] = function() vscode.call "editor.action.goToImplementation" end,
          ["gd"] = function() vscode.call "editor.action.revealDefinition" end,
          ["gf"] = function() vscode.call "editor.action.goToReferences" end,
        },
        v = {
          ["H"] = "5h",
          ["J"] = "5j",
          ["K"] = "5k",
          ["L"] = "5l",
        },
      },
    },
  },
  -- disable colorscheme setting
  { "AstroNvim/astroui", opts = { colorscheme = false } },
  -- disable treesitter highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { highlight = { enable = false } },
  },
  -- {
  --   "vscode-neovim/vscode-multi-cursor.nvim",
  --   event = "VeryLazy",
  --   opts = function() return opts end,
  -- },
}
