vim.api.nvim_exec(
    [[
    set tabstop=4 shiftwidth=4 expandtab
    autocmd Filetype sh setlocal expandtab tabstop=4 shiftwidth=4
    autocmd Filetype javascript setlocal expandtab tabstop=4 shiftwidth=4
    autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4
   ]],
    false
)

