local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>f', builtin.find_files, {})

map("n", "<F2>", ":w<CR>", {})
map("i", "<F2>", "<Esc>:w<CR>", {})
map("n", "<F9>", ":vsplit <Bar> execute 'terminal g++ -g % -o %:r && ./%:r' <Bar> startinsert<CR>", {})
map("n", "<F5", ":vsplit <Bar> execute 'terminal g++ -fsanitize=address -std=c++17 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp' <Bar> startinsert<CR>", {})


