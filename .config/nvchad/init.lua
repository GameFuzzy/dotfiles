vim.wo.relativenumber = true
vim.g.dap_virtual_text = true

vim.cmd([[
function OpenMarkdownPreview (url)
  execute "silent ! open -a Firefox -n --args --new-window " . a:url
endfunction
let g:mkdp_browserfunc = 'OpenMarkdownPreview'
]])
