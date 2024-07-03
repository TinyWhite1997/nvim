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
          ["<Leader>ff"] = "<CMD>Find<CR>",
          -- ["<Leader>w"] = "<CMD>w<CR>",
          ["<Leader>q"] = "<CMD>Quit<CR>",
          ["\\"] = function() vscode.call "workbench.action.splitEditorRight" end,
          ["|"] = function() vscode.call "workbench.action.splitEditorDown" end,
          ["<Leader>fw"] = function() vscode.call "workbench.action.findInFiles" end,
          ["<Leader>ls"] = function() vscode.call "workbench.action.gotoSymbol" end,
          ["<Leader>z"] = function() vscode.call "workbench.action.toggleZenMode" end,
          ["<Leader>b"] = function() vscode.call "extension.toggleBool" end,
          ["<Leader>e"] = function() vscode.call "workbench.action.toggleSidebarVisibility" end,
          ["<Leader>o"] = function() vscode.call "workbench.files.action.focusFilesExplorer" end,
          ["<Leader>p"] = function() vscode.call "workbench.action.togglePanel" end,
          ["<Leader>]"] = "<CMD>Tabnext<CR>",
          ["<Leader>["] = "<CMD>Tabprevious<CR>",
          ["_"] = "$",
          -- ["<leader>o"] = "<CMD>lua require('vscode').call('workbench.actionfiles.openFile')<CR>",
          -- ["<leader>g"] = "<CMD>lua require('vscode').call('workbench.action.gotoLine')<CR>",
          ["<leader>h"] = "<CMD>lua require('vscode').call('workbench.action.navigateBack')<CR>",
          ["<leader>l"] = "<CMD>lua require('vscode').call('workbench.action.navigateForward')<CR>",
          -- ["<leader>u"] = "<CMD>lua require('vscode').call('workbench.action.undo')<CR>",
          -- ["<leader>r"] = "<CMD>lua require('vscode').call('workbench.action.redo')<CR>",
          -- ["<leader>c"] = "<CMD>lua require('vscode').call('workbench.action.clipboardCopyAction')<CR>",
          -- ["<leader>x"] = "<CMD>lua require('vscode').call('workbench.action.clipboardCutAction')<CR>",
          -- ["<leader>v"] = "<CMD>lua require('vscode').call('workbench.action.clipboardPasteAction')<CR>",
          ["<leader>a"] = function() vscode.call "editor.action.selectAll" end,
          -- ["<leader>d"] = "<CMD>lua require('vscode').call('workbench.action.debug.start')<CR>",
          -- ["<leader>q"] = "<CMD>lua require('vscode').call('workbench.action.debug.stop')<CR>",
          -- ["<leader>h"] = "<CMD>lua require('vscode').call('workbench.action.debug.stepOver')<CR>",
          -- ["<leader>l"] = "<CMD>lua require('vscode').call('workbench.action.debug.stepInto')<CR>",
          -- ["<leader>u"] = "<CMD>lua require('vscode').call('workbench.action.debug.stepOut')<CR>",
          -- ["<leader>r"] = "<CMD>lua require('vscode').call('workbench.action.debug.restart')<CR>",
          -- ["<leader>c"] = "<CMD>lua require('vscode').call('workbench.action.debug.continue')<CR>",
        },
        v = {
          ["J"] = "5j",
          ["H"] = "5h",
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
  {
    "vscode-neovim/vscode-multi-cursor.nvim",
    event = "VeryLazy",
    opts = function() return opts end,
  },
}
