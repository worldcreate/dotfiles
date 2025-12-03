call jetpack#begin()

call jetpack#add('neovim/nvim-lspconfig')

" color scheme
call jetpack#add('rebelot/kanagawa.nvim')

call jetpack#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})

" ファイラー
call jetpack#add('stevearc/oil.nvim')
call jetpack#add('nvim-mini/mini.nvim')

" Editor
call jetpack#add("shellRaining/hlchunk.nvim", { 'on_event': ["BufReadPre", "BufNewFile"]})
call jetpack#add('editorconfig/editorconfig-vim')
call jetpack#add('vim-denops/denops.vim')
call jetpack#add('easymotion/vim-easymotion')

" Git差分表示
call jetpack#add('lewis6991/gitsigns.nvim')

" Telescope ファジーファインダー

call jetpack#add('nvim-lua/plenary.nvim')
call jetpack#add('nvim-telescope/telescope.nvim')

call jetpack#add("akinsho/toggleterm.nvim")

call jetpack#end()

colorscheme kanagawa

set number
set relativenumber


" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

set mouse=

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" ================================ keyconfig

let mapleader = "\<Space>"

nnoremap <silent> <leader>rr :source $MYVIMRC<CR>
nnoremap <silent> <leader>O :e $MYVIMRC<CR>

" ============================== LSP

lua << EOF
vim.lsp.enable('rust_analyzer')

vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>ff', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})

EOF

" ================================ gitsigns

:lua require('gitsigns').setup()
set signcolumn=yes

" ================================ telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>


lua << EOF
  require("oil").setup()
  require('mini.icons').setup()
  require("hlchunk").setup({
      chunk = {
          enable = true
      },
      indent = {
          enable = true
      },
      line_num = {
  	enable = true
      },
      blank = {
  	enable = true
      }
  })

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
    }
  }

  require("toggleterm").setup({
    open_mapping = [[<c-\>]],
    direction = 'float'
  })
  function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
    vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
  end

  vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF
nnoremap <silent> <leader>E :Oil<CR>

" ================================ 自作status line
let s:file_fg='RoyalBlue3'
let s:file_bg='LightSkyBlue3'
let s:status_bg='DarkSlateGray'
let s:status_fg='skyblue1'

let s:normal_bg='LightSeaGreen'
let s:normal_fg='DarkSlateBlue'
let s:insert_bg='RoyalBlue'
let s:insert_fg='white'
let s:visual_bg='coral'
let s:visual_fg='white'
let s:replace_bg='LightGoldenrod1'
let s:replace_fg='black'

execute 'hi User1 gui=bold guibg='.s:status_bg.' guifg='.s:status_fg

execute 'hi User2 gui=bold guibg='.s:normal_bg.' guifg='.s:normal_fg
execute 'hi User6 gui=bold guibg='.s:file_bg.' guifg='.s:normal_bg

execute 'hi User3 gui=bold guibg='.s:insert_bg.' guifg='.s:insert_fg
execute 'hi User7 gui=bold guibg='.s:file_bg.' guifg='.s:insert_bg

execute 'hi User4 gui=bold guibg='.s:visual_bg.' guifg='.s:visual_fg
execute 'hi User8 gui=bold guibg='.s:file_bg.' guifg='.s:visual_bg

execute 'hi User5 gui=bold guibg='.s:replace_bg.' guifg='.s:replace_fg
execute 'hi User9 gui=bold guibg='.s:file_bg.' guifg='.s:replace_bg

execute 'hi User10 gui=bold guibg='.s:file_bg.' guifg='.s:file_fg
execute 'hi User11 gui=bold guibg='.s:status_bg.' guifg='.s:file_bg

let s:file_info_bg='MediumPurple1'
let s:line_info_bg='MediumPurple'
let s:right_info_fg='gray100'

"line
execute 'hi User12 gui=bold guibg='.s:line_info_bg.' guifg='.s:right_info_fg
execute 'hi User13 gui=bold guibg='.s:file_info_bg.' guifg=MediumPurple'

"file
execute 'hi User14 gui=bold guibg='.s:file_info_bg.' guifg='.s:right_info_fg
execute 'hi User15 gui=bold guibg='.s:file_info_bg.' guifg=MidnightBlue'
execute 'hi User16 gui=bold guibg='.s:status_bg.' guifg='.s:file_info_bg

execute 'hi StatusLineNC gui=bold guibg='.s:status_bg.' guifg='.s:status_fg
execute 'hi StatusLineTerm gui=bold guibg='.s:status_bg.' guifg='.s:status_fg
execute 'hi StatusLineTermNC gui=bold guibg='.s:status_bg.' guifg='.s:status_fg


let s:mode_map = {
      \     'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE', 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
      \     'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE', "\<C-s>": 'S-BLOCK', 't': 'TERMINAL'
      \   }

let s:mode_color_map = {
      \     'n': '2', 'i': '3', 'R': '4', 'v': '5', 'V': '5', "\<C-v>": '5',
      \     'c': '5', 's': '3', 'S': '3', "\<C-s>": '3', 't': '5'
      \   }

let s:l_sep=''
let s:r_sep=''
let s:r_sep2=''

function! ModeStr() abort
  let l:c = get(s:mode_color_map, mode(), '1')
  let l:separete_c = l:c + 4

  return '%#User'.l:c.'# '.get(s:mode_map, mode(), '').' '.'%#User'.l:separete_c.'#'.s:l_sep
endfunction

function! GetStatusLine() abort
  let l:s = ModeStr().'%#User10# %m%{expand(''%'')}%R %#User11#'.s:l_sep.'%1*'
  let l:s = l:s.'%='
  let l:s.='%#User16#'.s:r_sep.'%#User14# %y %#User15#'.s:r_sep2.'%#User14# [%{&fileencoding}] %#User15#'.s:r_sep2.'%#User14# [%{&fileformat}] '
  let l:s.='%#User13#'.s:r_sep.'%#User12# %l/%L:%c u%02B '
  return l:s
endfunction

set statusline=%!GetStatusLine()
