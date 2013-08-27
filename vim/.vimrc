" Vundle setup
    set nocompatible " be iMproved
    filetype off     " required!
    so ~/.mydot/vim/bundles.vim

    filetype plugin indent on     " required!


" Interface
    set nonumber
    set encoding=utf-8            
    set fileencodings=utf-8,cp1251 " Возможные кодировки файлов и последовательность определения
    set wildmode=list:longest,full " Автодополнение на манер zsh
    set wildmenu " Саджест по <tab> в командной строке
                 " When 'wildmenu' is on, command-line completion operates in an enhanced
                 " mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
                 " the possible matches are shown just above the command line, with the
                 " first match highlighted (overwriting the status line, if there is
                 " one).
    set wildignore+=.hg,.git,.svn " Version control
    set wildignore+=*.DS_Store    " OSX bullshit
    set wildignore+=*.pyc         " Python byte code
    set title    " window title
                 " the title of the window will be set to the value of 'titlestring'
                 " (if it is not empty), or to: filename [+=-] (path) - VIM
    set showcmd  " Show (partial) command in the last line of the screen
                 " Set this option off if your terminal is slow.
                 " In Visual mode the size of the selected area is shown:
                 " - When selecting characters within a line, the number of characters.
                 "   If the number of bytes is different it is also displayed: "2-6"
                 "   means two characters and six bytes.
                 " - When selecting more than one line, the number of lines.
                 " - When selecting a block, the size in screen characters:
                 "   {lines}x{columns}.
    set scrolloff=5       " how many lines of buffer you want around the top and bottom of the screen before it starts to scroll
    set showtabline=1       " Показывать вкладки табов только когда их больше одной
    "set list                " display unprintable characters
    set wrap                " Включаем перенос строк (http://vimcasts.org/episodes/soft-wrapping-text/)
    if version >= 703
        set colorcolumn=80 " Подсвечиваем 80 столбец
    end
    set textwidth=80
    set formatoptions-=o    " dont continue comments when pushing o/O
    set linebreak           " Перенос не разрывая слов
    set autoindent          " Копирует отступ от предыдущей строки
    set smartindent         " Включаем 'умную' автоматическую расстановку отступов
    set expandtab
    set shiftwidth=4        " Размер сдвига при нажатии на клавиши << и >>
    set tabstop=4           " Размер табуляции
    set softtabstop=4
    set linespace=1         " add some line space for easy reading
    set cursorline          " Подсветка строки, в которой находится в данный момент курсор
    set gcr=n:blinkon0      " Отключаем мигание курсора в MacVim. Больше никакого стресса.
    set guioptions=         " Вырубаем все лишнее из ГУИ, если надо потогглить см <F6>
    set t_Co=256            " Кол-во цветов
    set guicursor=          " Отключаем мигание курсора
    set splitbelow          " новый сплит будет ниже текущего :sp
    set splitright          " новый сплит будет правее текущего :vsp
    set shortmess+=I        " не показывать intro screen
    set mouseshape=s:udsizing,m:no " turn to a sizing arrow over the status lines
    set mousehide " Hide the mouse when typing text

    set hidden " this allows to edit several files in the same time without having to save them

    " Не бибикать!
        set visualbell " Use visual bell instead of beeping
        set t_vb=

    " http://www.allaboutvim.ru/2012/03/blog-post.html
        set path=.,,**

    " Символ табуляции и конца строки
        if has('multi_byte')
            if version >= 700
                set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
            else
                set listchars=tab:»\ ,trail:·,extends:>,precedes:<,nbsp:_
            endif
        endif

    " Символ, который будет показан перед перенесенной строкой
        if has("linebreak")
              let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
        endif


        set laststatus=2 "display status line always




    " Создаем меню с кодировками
        menu Encoding.UTF-8 :e ++enc=utf8 <CR>
        menu Encoding.Windows-1251 :e ++enc=cp1251<CR>
        menu Encoding.koi8-r :e ++enc=koi8-r<CR>
        menu Encoding.cp866 :e ++enc=cp866<CR>

    " Проверка орфографии
        if version >= 700
            set spell spelllang= 
            set nospell " По умолчанию проверка орфографии выключена
            menu Spell.off :setlocal spell spelllang= <cr>
            menu Spell.Russian+English :setlocal spell spelllang=ru,en <cr>
            menu Spell.Russian :setlocal spell spelllang=ru <cr>
            menu Spell.English :setlocal spell spelllang=en <cr>
            menu Spell.-SpellControl- :
            menu Spell.Word\ Suggest<Tab>z= z=
            menu Spell.Previous\ Wrong\ Word<Tab>[s [s
            menu Spell.Next\ Wrong\ Word<Tab>]s ]s
        endif

    " Фолдинг
        " Всё, что нужно знать для начала:
        " za - скрыть/открыть текущую складку.
        " {zR, zM} - {открыть, скрыть} все складки.
        " from https://github.com/sjl/dotfiles/blob/master/vim/.vimrc
        set foldcolumn=0        " Ширина строки где располагается фолдинг
        set foldmethod=syntax   " Фолдинг по отступам
        set foldnestmax=10      " Глубина фолдинга 10 уровней
        set nofoldenable        " Не фолдить по умолчанию
        set foldlevel=1         " This is just what i use
        set fillchars="fold: "  " remove the extrafills --------
        let javaScript_fold=1 " JavaScript

    " Не показывать парную скобку
        let loaded_matchparen=1 " перестает прыгать на парную скобку, показывая где она. +100 к скорости
        set noshowmatch " Не показывать парные <> в HTML


" Search
    set incsearch   " При поиске перескакивать на найденный текст в процессе набора строки
    set hlsearch    " Включаем подсветку выражения, которое ищется в тексте
    set ignorecase  " Игнорировать регистр букв при поиске
    set smartcase   " Override the 'ignorecase' if the search pattern contains upper case characters
    set gdefault    " Включает флаг g в командах замены, типа :%s/a/b/




    let g:relativenumber = 0
    function! ToogleRelativeNumber()
      if g:relativenumber == 0
        let g:relativenumber = 1
        set number
        echo "Show line numbers"
      else
        let g:relativenumber = 0
        set nonumber
        echo "Show no line numbers"
      endif
    endfunction

    let g:statuslinestate = 0
    function! ToggleStatusLine()
        if g:statuslinestate == 0
            let g:statuslinestate = 1
            set laststatus=0
        else
            let g:statuslinestate = 0
            set laststatus=2
        endif
    endfunction

    function! ToggleGUINoise()
      if &go==''
        exec('se go=mTrL')
        echo "Show GUI elements"
      else
        exec('se go=')
        echo "Show no GUI elements"
      endif
    endfunction
    
    set mouse=a
    
    function! Replace()
        let s:word = input("Replace " . expand('<cword>') . " with:")
        :exe 'bufdo! %s/\<' . expand('<cword>') . '\>/' . s:word . '/gce'
        :unlet! s:word
    endfunction

" Environment
    set noautochdir "prevent change dir for CommandT
    set history=1000 " store lots of :cmdline history
    "cmap w!! %!sudo tee > /dev/null % " save file with root permissions"
    "command! W exec 'w !sudo tee % > /dev/null' | e!

    " Backspacing settings
        " start     allow backspacing over the start of insert;
        "           CTRL-W and CTRL-U stop once at the start of insert.
        " indent    allow backspacing over autoindent
        " eol       allow backspacing over line breaks (join lines)
        set backspace=indent,eol,start

    " Backup и swp файлы
        set nobackup " Отключаем создание бэкапов
        set noswapfile " Отключаем создание swap файлов
        "set backupdir=~/.vimi/bac//,/tmp " Директория для backup файлов
        "set directory=~/.vimi/swp//,/tmp " Директория для swp файлов

    " Загрузка предыдущей сессии
        set viminfo='10,\"100,:20,%,n~/.viminfo
        " Устанавливаем курсор в файле на место, где он был при закрытии этого файла
        au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

    " AutoReload .vimrc
        " from http://vimcasts.org/episodes/updating-your-vimrc-file-on-the-fly/
        " Source the vimrc file after saving it
        if has("autocmd")
          autocmd! bufwritepost .vimrc source $MYVIMRC
        endif

    " Go to last file(s) if invoked without arguments
        " http://vimcastsim.wikia.com/wiki/Open_the_last_edited_file
        " autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
        "     \ call mkdir($HOME . "/.vim") |
        "     \ endif |
        "     \ execute "mksession! " . $HOME . "/.vim/Session.vim"
        " autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
        "     \ execute "source " . $HOME . "/.vim/Session.vim"

    " Auto change the directory to the current file I'm working on
        autocmd BufEnter * lcd %:p:h

    " Актуально только для MacVim
        " Save on losing focus
            autocmd FocusLost * :wa

        " Resize splits when the window is resized
            autocmd VimResized * exe "normal! \<c-w>="





" File specific
    autocmd BufNewFile *.py 0r ~/.vimi/templates/template.py
    autocmd BufNewFile *.xml 0r ~/.vimi/templates/template.xml
    autocmd BufNewFile *.xsl 0r ~/.vimi/templates/template.xsl
    autocmd BufNewFile *.jade 0r ~/.vimi/templates/template.jade
    autocmd BufNewFile *.html 0r ~/.vimi/templates/template.html

    autocmd FileType jade setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2



" Плагины

    " Solarized
        syntax enable
        " http://stackoverflow.com/questions/7278267/incorrect-colors-with-vim-in-iterm2-using-solarized#comment11144700_7278548
        let g:solarized_termcolors=16
        set background=light
        try
            colorscheme solarized
        catch /^Vim\%((\a\+)\)\=:E185/
            echo "Solarized theme not found. Run :BundleInstall"
        endtry

        try
            call togglebg#map("<Leader>b")
        catch /^Vim\%((\a\+)\)\=:E117/
            " :(
        endtry

    " NERDTree
        let NERDTreeShowBookmarks=1
        let NERDTreeChDirMode=2
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowHidden=1
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeMinimalUI=1 " Disables display of the 'Bookmarks' label and 'Press ? for help' text.
        let NERDTreeDirArrows=1 " Tells the NERD tree to use arrows instead of + ~ chars when displaying directories.
        let NERDTreeBookmarksFile= $HOME . '/.vim/.NERDTreeBookmarks'

    " Zen Coding
        let g:user_zen_settings = {
          \  'php' : {
          \    'extends' : 'html',
          \    'filters' : 'c',
          \  },
          \  'xml' : {
          \    'extends' : 'html',
          \  },
          \  'haml' : {
          \    'extends' : 'html',
          \  },
          \}

    " UltiSnips
        let g:UltiSnipsExpandTrigger="<tab>"
        let g:UltiSnipsJumpForwardTrigger="<tab>"
        let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

     
    " VimWiki
        let g:vimwiki_list = [{'path': '~/Dropbox/vimwiki/'}]
       
      " let Tlist_Ctags_Cmd='/usr/local/bin/jsctags'
        filetype on
"User bash instead shell
set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i
"set shell=/bin/zsh\ -l
"set shell=zsh\ -i
"Tagbar
let g:tagbar_left = 1
let g:tagbar_compact = 1
let g:tagbar_width = 30
let g:tagbar_autofocus = 1

let snippets_dir="~/.mydot/vim/snippets"

syn match Tag /^\s*Bundle/
au FileType javascript set dictionary+=$HOME/.mydot/vim/dict/node.dict

"so ~/temp/tern/vim/tern.vim
" Шорткаты
so ~/.mydot/vim/keys.vim
let g:rooter_patterns = ['.prj/','.git/', '.git', '_darcs/', '.hg/', '.bzr/', '.svn/', '.prj/']

"let g:airline_powerline_fonts = 0
let g:airline_theme='solarized' "dark simple light badwolf solarized dark
