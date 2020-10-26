set autoindent
set number relativenumber
"set ruler
set mouse=a
set number
syntax on
"""""""""""""""""
set scrolloff=2 " Keep 3 lines below and above the cursor
""""""""""""""""""""""""""""""""""""
" Set SuperTab completion to use omni-func completion:
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
let g:SuperTabDefaultCompletionType = "context"

""""""""""""""""""""""""""""""""""""
" Set tex files as latex type:
let g:tex_flavor = "latex"

"For latex compiler to work with vimtex:
let g:vimtex_compiler_progname = 'nvr' " use neovim-remote

let g:Tex_IgnoredWarnings = 
    \'Underfull'."\n".
    \'Overfull'."\n".
    \'Double space found.'
let g:Tex_IgnoreLevel = 8
" Omnicompletion:
inoremap <C-o> <C-X><C-O>

"nnoremap <Leader>ll <Plug>VimtexCompile
""""""""""""""""""""""""""""""""""""
" Completions
" Enable omnifunc completions:
filetype plugin on 
set omnifunc=syntaxcomplete#Complete

" Allows colon (:) to be recognized as part of w words. Serves as workaround for reference completion.
"set iskeyword+=: "messes up some python highlighting...
set iskeyword-=:
" Do the same for \ and -
set iskeyword+=\
"set iskeyword+=-

" Add bibliography of thesis to the buffer, so that SuperTab can be use to complete references.
badd /home/simoes/Desktop/Cloud/UUtrecht/Thesis/References/library.bib

"""""""""""""""""""""""""""""""""""""

filetype plugin indent on
" move within a wrapped line
"nnoremap j gj
"vnoremap j gj
"nnoremap k gk
"vnoremap k gk

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal emulator stuff
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Find job id explicitly:
command GetId execute "echo b:terminal_job_id"

" Initialize python session
function! InitSession()
	exec "vsplit | vertical resize -10 | terminal ipython"
	let jobid = b:terminal_job_id
	exec "wincmd h"
	let b:slime_config = {"jobid": "0"} ""Create the dictionary
	let b:slime_config["jobid"] = jobid
endfunction

command! InitSession call InitSession()

" Delete marks... really
command -nargs=+ Delmarks execute "delmarks <args> | wviminfo!"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map Esc to leave terminal emulator.
tnoremap <Esc> <C-\><C-n>

" To create begin, end environment in latex:
noremap \b c\begin{<C-R>"}<CR>\end{<C-R>"}

command! Vimrc :execute 'tabnew $MYVIMRC'
command! Reload :execute 'source $MYVIMRC'

""""""""""""""""""""""""""""""""""""

" Easy Python commenting and uncommenting:
vnoremap <silent> # :s/^/#/<cr>:noh<cr>
vnoremap <silent> -# :s/^#//<cr>:noh<cr>

" Remap fold toggle:
"nnoremap <space> za  "It messes with todo lists of vimwiki.

" This autocloses parenthesis:
"inoremap " ""<left>
"inoremap ' ''<left>
"inoremap ( ()<left>
"inoremap [ []<left>
"inoremap { {}<left>

" This makes Y copy until end of line:
nmap Y y$

" ALE used LSP from COC:
let g:ale_disable_lsp = 1
""""""""""""""""""""""""""""""""""""
" Plugin manager vim-plug:

call plug#begin('~/.local/share/nvim/plugged')

"Plug 'https://github.com/raghur/vim-ghost.git' " GhostText
Plug 'https://github.com/tpope/vim-surround.git' " Surround
Plug 'https://github.com/kien/rainbow_parentheses.vim.git' " Raimbow Parenthesis
Plug 'https://github.com/ervandew/supertab.git' " SuperTab 
Plug 'https://github.com/itchyny/lightline.vim.git' " Lightline (Better design of Mode display)
Plug 'https://github.com/terryma/vim-multiple-cursors.git' " Multiple Cursors
"Plug 'https://github.com/vim-scripts/restore_view.vim.git' " Restore View (Remembers folding and cursor position between sessions)
Plug 'https://github.com/lervag/vimtex.git' " Vim tex
"Plug 'https://github.com/vim-latex/vim-latex' " Latex suite - for <F5> environment creator!
Plug 'calviken/vim-gdscript3' " Godot script syntax
"Plug 'https://github.com/chrisbra/unicode.vim.git' Unicode plugin (It's not working...)
"Plug 'https://github.com/joom/latex-unicoder.vim.git' Latex unicoder - Interferes with my split navigation because of <C-l>
"Plug 'joshdick/onedark.vim' OneDark Theme
Plug 'sheerun/vim-polyglot' " Better highlighting
Plug 'bignimbus/pop-punk.vim' " Pop-punk Theme
Plug 'kshenoy/vim-signature' " Marks visualization
Plug 'preservim/nerdtree' 
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/bash-support.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" ######### Python plugins ##############################
Plug 'jeetsukumaran/vim-pythonsense' " Python motions
"Plug 'Vimjas/vim-python-pep8-indent' Python indentation.
"Plug 'https://github.com/tmhedberg/SimpylFold.git' Python indentation-based folding:
Plug 'dense-analysis/ale' " Linting (syntax error finder) 
"Plug 'davidhalter/jedi-vim' Completion with jedi.
" Ipython connection:
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'neoclide/coc.nvim', {'branch': 'release'} "To use with Python must do :CocInstall coc-python.
"Plug 'vim-pandoc/vim-pandoc' "Pandoc is for markdown stuff: :Pandoc creates html file.
Plug 'vim-pandoc/vim-pandoc-syntax'

call plug#end()

" coc-nvim stuff:
nmap <space>gd <Plug>(coc-definition)
nmap <space>gr <Plug>(coc-references)

" Bash plugin stuff: [[Not working idk why...]]
"let g:BASH_AuthorName   = 'simoes'
"let g:BASH_Email        = 'francisconfqsimoes@gmail.com'

" vimwiki with markdown:
"let g:vimwiki_list = [{'path': '~/vimwiki/',
"                      \ 'syntax': 'markdown', 'ext': '.md'}]
"let g:vimwiki_list = [{'path': '~/Sync/wiki/', 'syntax': 'markdown'}]
"au FileType vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

"" use other stuff instead of TAB for jumping between links.
"nmap <Leader>nl <Plug>VimwikiNextLink
"nmap <Leader>pl <Plug>VimwikiPrevLink
let g:vimwiki_table_mappings = 0 "deactivates vimwiki tab in insert mode"
""vimwiki damage control:
""remaps tab, so that supertab behaves as expected:
"autocmd VimEnter * inoremap <tab> <c-n> 
"autocmd VimEnter * inoremap <s-tab> <c-p>

" File fuzzy finding using fzf plugin:
nnoremap <C-p> :Files<CR> 

" Nerdtree keybind
nnoremap <C-t> :NERDTree<CR>

"python.jediEnabled": false
""""""""""""""""""""""""""""""""""""

"" Specify linters and fixers to use with the ALE plugin
let g:ale_linters = {'python': ['flake8', 'mypy'], 'tex': ['lacheck']} 
let g:ale_linters_explicit = 1 " No other linters will be used.
let g:ale_fixers = {'python': ['black']} 

" Navigate between errors:
nnoremap ]e :ALENextWrap<CR>
nnoremap [e :ALEPreviousWrap<CR>

" Other ALE configs 
let g:ale_lint_on_text_changed = 1
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'

""""""""""""""""""""""""""""""""""""
" slime plugin config with neovim directly
let g:slime_target = "neovim"
""""""""""""""""""""""""""""""""""""
"------------------------------------------------------------------------------
" ipython-cell configuration
"------------------------------------------------------------------------------
" Uncomment to use marks to define cells.
let g:ipython_cell_delimit_cells_by = 'marks'

" Keyboard mappings. <Leader> is \ (backslash) by default

" map <Leader>r to run entire script
nnoremap <Leader>r :IPythonCellRun<CR>

" map <Leader>R to run script and time the execution
nnoremap <Leader>t :IPythonCellRunTime<CR>

" map <Leader>c to execute the current cell
nnoremap <Leader>c :IPythonCellExecuteCell<CR>

" map <Leader>C to execute the current cell and jump to the next cell
nnoremap <Leader>C :IPythonCellExecuteCellJump<CR>

" map <Leader>l to clear IPython screen
"nnoremap <Leader>l :IPythonCellClear<CR>

" map <Leader>x to close all Matplotlib figure windows
nnoremap <Leader>x :IPythonCellClose<CR>

" map [c and ]c to jump to the previous and next cell header
nnoremap [c :IPythonCellPrevCell<CR>
nnoremap ]c :IPythonCellNextCell<CR>

" map <Leader>h to send the current line or current selection to IPython
nmap <Leader>s <Plug>SlimeLineSend
xmap <Leader>s <Plug>SlimeRegionSend

" map <Leader>p to run the previous command
nnoremap <Leader>p :IPythonCellPrevCommand<CR>

" map <Leader>Q to restart ipython
nnoremap <Leader>Q :IPythonCellRestart<CR>

" map <Leader>d to start debug mode
nnoremap <Leader>d :SlimeSend1 %debug<CR>

" map <Leader>q to exit debug mode or IPython
" nnoremap <Leader>q :SlimeSend1 exit<CR>

"""""""""
" Function to permanently delete views created by 'mkview'
function! MyDeleteView()
    let path = fnamemodify(bufname('%'),':p')
    " vim's odd =~ escaping for /
    let path = substitute(path, '=', '==', 'g')
    if empty($HOME)
    else
        let path = substitute(path, '^'.$HOME, '\~', '')
    endif
    let path = substitute(path, '/', '=+', 'g') . '='
    " view directory
    let path = &viewdir.'/'.path
    call delete(path)
    echo "Deleted: ".path
endfunction

" Command Delview (and it's abbreviation 'delview')
command Delview call MyDeleteView()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Splitting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright

"Remap splits navigation to Ctrl hjkl
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

"Friendly size adjustment
noremap <C-Left> :vertical resize +3<CR>
noremap <C-Right> :vertical resize -3<CR>
noremap <C-Up> :resize +3<CR>
noremap <C-Down> :resize -3<CR>

"Window to horizontal or vertical
noremap <C-w>tv <C-w>t<C-W>H
noremap <C-w>th <C-w>t<C-W>K

" -------------------------------------------
" Better completion:
" -------------------------------------------
"set complete=.,w,b,u,t,i,kspell
set complete=.,w,b,u,t
"
" -------------------------------------------
" Set foldmethod:
" -------------------------------------------
set foldmethod=manual

" -------------------------------------------
" Colorschemes:
" -------------------------------------------
"
"Neosolarized:
"let g:neosolarized_contrast = "high"
"set background=dark
"set termguicolors
"colorscheme NeoSolarized

"colorscheme desert
colorscheme pop-punk

"Onedark
" Better grey color:
"let g:onedark_color_overrides = {
"\ "comment_grey": {"gui": "#afafff", "cterm": "146" },
"\ "gutter_fg_grey": {"gui": "#6c6c6c", "cterm": "242" },
"\ "cursor_grey": {"gui": "#ffffff", "cterm": "231" }
"\}
"colorscheme onedark
"
""""""""""""""""""""""""""""""""""""
" Highlight line with dark blue
set cursorline
hi CursorLine   cterm=NONE ctermbg=18 ctermfg=NONE

" Python indentation-based folding:
set foldmethod=indent

" Better fold colors
hi Folded ctermbg=black ctermfg=gray

" Same background (may be transparent) as terminal:
hi Normal guibg=NONE ctermbg=NONE
