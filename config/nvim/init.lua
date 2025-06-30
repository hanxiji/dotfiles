require('config.options')

require("config.keybindings")

require("config.lazy")

require("config.autocmds")

vim.o.background = "dark" -- "dark" or "light"
vim.cmd([[colorscheme gruvbox]])
