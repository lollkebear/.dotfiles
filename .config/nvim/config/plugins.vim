" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'neoclide/coc.nvim', {'branch': 'release'} " Stable version of coc
  Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'} " Keeping up to date with master

  " eye candy
  Plug 'wadackel/vim-dogrun'
  Plug 'ryanoasis/vim-devicons'

  " navigation
  Plug '/usr/local/opt/fzf'
  Plug 'scrooloose/nerdtree'

  " language tools
  Plug 'w0rp/ale'
  Plug 'janko-m/vim-test'

  Plug 'benmills/vimux'

  " Frontend
  Plug 'kchmck/vim-coffee-script'
  Plug 'Chiel92/vim-autoformat'
  Plug 'mattn/emmet-vim'

  " Ruby on Rails
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-ragtag'

  " Editinng
  Plug 'tpope/vim-commentary'
  Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
