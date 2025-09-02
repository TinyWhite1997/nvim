-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  local result = vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
  if vim.v.shell_error ~= 0 then
    -- stylua: ignore
    vim.api.nvim_echo({ { ("Error cloning lazy.nvim:\n%s\n"):format(result), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
    vim.fn.getchar()
    vim.cmd.quit()
  end
end

vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

vim.api.nvim_set_hl(0, "RenderMarkdownH1", { bg = "#ffd6cc", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2", { bg = "#e0f2fe", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3", { bg = "#d5f5e3", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH4", { bg = "#fdebd0", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH5", { bg = "#e8daef", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH6", { bg = "#f2f3f4", bold = true })
vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "RenderMarkdownH1" })
vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "RenderMarkdownH2" })
vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "RenderMarkdownH3" })
vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { link = "RenderMarkdownH4" })
vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { link = "RenderMarkdownH5" })
vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { link = "RenderMarkdownH6" })
vim.api.nvim_set_hl(0, "RenderMarkdownH1Bg", { bg = "#8c3c2d", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH2Bg", { bg = "#0b4d80", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH3Bg", { bg = "#1c553b", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH4Bg", { bg = "#7e6000", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH5Bg", { bg = "#4a235a", bold = true })
vim.api.nvim_set_hl(0, "RenderMarkdownH6Bg", { bg = "#566573", bold = true })

require "lazy_setup"
require "polish"
