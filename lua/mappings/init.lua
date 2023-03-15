local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>t', ':NvimTreeToggle<CR>', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({search = vim.fn.input("Grep > ")});
end)

map("n", "<F2>", ":w<CR>", {})
map("i", "<F2>", "<Esc>:w<CR>", {})
map("n", "<F9>", ":vsplit <Bar> execute 'terminal g++ -g % -o %:r && ./%:r' <Bar> startinsert<CR>", {})

vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", 
    command = "nnoremap <F5> :vsplit <Bar> execute 'terminal g++ -fsanitize=address -std=c++20 -Wall -Wextra -Wshadow -DONPC -O2 -o %< % && ./%< < inp' <Bar> startinsert<CR>"})


vim.api.nvim_create_autocmd("FileType", { pattern = "cpp", 
    command = "nnoremap <F9> :vsplit <Bar> execute 'terminal g++ -g % -o %:r && ./%:r' <Bar> startinsert<CR>"})


vim.api.nvim_create_autocmd("FileType", { pattern = "py", 
    command = "nnoremap <F9> :vsplit <Bar> execute 'exec '!clear; python3' shellescape(@%, 1)' <Bar> startinsert<CR>"})

map("n", "=" , "ggVG=", {})


vim.keymap.set("n", "<F12>", ":bnext<CR>", {})
vim.keymap.set("n", "<F8>", ":nohl<CR>", {})
