-- Fix for tmux true color support
if vim.env.TMUX then
  vim.opt.termguicolors = true
  -- Modern Neovim handles tmux colors automatically
  -- No need for manual terminal codes in recent versions
end
