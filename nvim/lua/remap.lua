vim.g.mapleader = " "
vim.keymap.set("n", "<leader>fv", vim.cmd.Ex)

-- Map move lines
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==")
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==")
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi")
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")

--Remap for dealing with word wrap
--vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'")
--vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'")
--
--


-- go to the middle and also center the view using zz
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")



-- GO remaps --
vim.keymap.set(
    "n",
    "<leader>ee",
    "oif err != nil {<CR>}<ESC>Oreturn err<ESC>"
)

-- Git remaps --
vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")
vim.keymap.set("n", "<leader>gl", ":Git log --name-only<CR>")
