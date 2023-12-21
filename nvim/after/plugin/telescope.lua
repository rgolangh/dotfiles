-- Telescope
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}
--Add leader shortcuts
vim.keymap.set('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]])
vim.keymap.set('n', '<leader>ff', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]])
vim.keymap.set('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]])
vim.keymap.set('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]])
vim.keymap.set('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]])
vim.keymap.set('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]])
vim.keymap.set('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]])
vim.keymap.set('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]])
vim.keymap.set('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]])

