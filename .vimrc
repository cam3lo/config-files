"=======================================================================
"                                    Vundle
"=======================================================================
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins go here

Plugin 'christoomey/vim-tmux-navigator'

Plugin 'leafgarland/typescript-vim'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'kien/ctrlp.vim'

Plugin 'tpope/vim-fugitive'

Plugin 'Lokaltog/vim-powerline', {'rtp': 'powerline/bindings/vim/'}

Plugin 'Valloric/YouCompleteMe'

" tells auto-complete to go away after usage
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"=======================================================================
"                                    Plug
"=======================================================================
"
call plug#begin('~/.vim/plugins')

" Vim Clang Autoformatter
"   default: google
Plug 'rhysd/vim-clang-format'

call plug#end()

"=======================================================================
"                               netrw NERDtree
"=======================================================================
"
" Toggle Vexplore with F@
function! ToggleVExplorer()
  if exists("t:expl_buf_num")
      let expl_win_num = bufwinnr(t:expl_buf_num)
      if expl_win_num != -1
          let cur_win_nr = winnr()
          exec expl_win_num . 'wincmd w'
          close
          exec cur_win_nr . 'wincmd w'
          unlet t:expl_buf_num
      else
          unlet t:expl_buf_num
      endif
  else
      exec '1wincmd w'
      Vexplore
      let t:expl_buf_num = bufnr("%")
  endif
endfunction

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 25

"=======================================================================
"                                Remap Keys
"=======================================================================
"
map T :TaskList<CR>
map P :TlistToggle<CR>

" Split pane remaps
noremap <Tab> <C-w>w
noremap <C-Up> <C-w><Up>
noremap <C-Down> <C-w><Down>
noremap <C-n> <C-w>v

" Tab navigation
noremap <C-Left> :tabp<CR>
noremap <C-Right> :tabn<CR>

" Enable folding with space
noremap <leader> za

" Shortcut for goto definition for YouCompleteMe plugin space-g
" aka go to def of whatever I'm currently on
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Enable toggling for netrw tree
map <silent> <F2> :call ToggleVExplorer()<CR>

" Delete whitespace
:nnoremap <silent> <F5> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"=======================================================================
"                                  Folding
"=======================================================================
"
set foldmethod=indent
set foldnestmax=10
set foldcolumn=2
set nofoldenable
set foldlevel=99
set mouse=a

"=======================================================================
"                                  Color Scheme
"=======================================================================
"
set background=dark
set termguicolors
colorscheme ceudah

"=======================================================================
"                               Python Dev Config
"=======================================================================
"
au BufNewFile,BufRead *.py:
    \| set tabstop=4 |
    \| set softtabstop=0 |
    \| set shiftwidth=4 |
    \| set textwidth=79 |
    \| set expandtab |
    \| set autoindent |
    \| set fileformat=unix |

" Virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

let python_highlight_all=1

"=======================================================================
"                               C/C++ Dev Config
"=======================================================================
"
au BufNewFile,BufRead *.c,*.cc,*.cpp,*.h:
    \ set tabstop=4 |
    \ set softtabstop=0 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" need more things...

"=======================================================================
"                             Fullstack Dev Config
"=======================================================================
"
au BufNewFile,BufRead *.js,*.html,*.css,*.ts:
    \ set tabstop=2 |
    \ set softtabstop=0 |
    \ set shiftwidth=2 |
" enables vim-javascript plugin
let g:javascript_plugin_flow = 1
" enables .jsx syntax
let g:jsx_ext_required = 0
" need more things...

"=======================================================================
"                               Bash Scripting Config
"=======================================================================
"
au BufNewFile,BufRead *.sh,*.bash:
    \ set tabstop=4 |
    \ set softtabstop=0 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
" need more things...

"=======================================================================
"                             General Config
"=======================================================================
"
set encoding=utf-8
set number
"set numberwidth=2
set clipboard=unnamed
filetype plugin on
syntax on

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


