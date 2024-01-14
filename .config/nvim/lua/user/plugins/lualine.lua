-- import lualine plugin safely
local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- configure lualine with dracula theme
lualine.setup({
  options = {
    theme = "dracula-nvim",
  },
})