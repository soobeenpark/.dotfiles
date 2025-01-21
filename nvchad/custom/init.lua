-- set colour column at 100 characters
vim.opt.colorcolumn = '100'

-- enable delta line numbers
vim.opt.relativenumber = true

-- for competitive programming (c++)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
      vim.api.nvim_buf_set_keymap(0,"n","<C-g>",":split<CR>:te g++-14 -std=c++14 -Wshadow -Wall -o out % -g -D_GLIBCXX_DEBUG && ./out < in<CR>i", {})
  end
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = "cpp",
  callback = function()
    vim.keymap.set('n', '<C-i>', function()
      os.execute('pbpaste > in')
    end, { noremap = true, buffer = true }
    )
  end
})

