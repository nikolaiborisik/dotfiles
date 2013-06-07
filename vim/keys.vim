"Filename completions <C-x><C-f>
"Fx - Передвинуть курсор назад к предыдущему вхождению символа х в текущей
"строке
"tx - Передвинуть курсор вперед к следующему вхождению символа х в текущей
"строке и установить курсор перед символом x
"{/} - перейти к следующему/предыдущему параграфу
"'. - перейти к последнему месту, где производилось редактирование
"D - удалить от текущей позиции до конца строки
"
" with LEADER
    let mapleader = "," " мапим <Leader> на запятую. По умолчанию <Leader> это обратный слэш \

    ",1
        nmap <Leader>1 :NERDTreeToggle<CR>

    ",2
        nmap <Leader>2 :GundoToggle<CR> 
    ",3
        nmap <Leader>3 :TagbarOpenAutoClose<CR>
    
    ",4 
        nmap <Leader>4 :Gstatus<CR>

    ",5 
        nmap <Leader>5 :JSHint<CR>

    ",6 
        nmap <Leader>6 :Extradite<CR>
    ",6 TodoList
        map <unique> <Leader>7 <Plug>TaskList
    ",q quit
        map <Leader>q :q<CR>
    ",w start webstorm
        map <Leader>w :execute "!ws %:p ".line(".")<CR>       

   ",e
        map <Leader>e <C-w>w

    ",r  Поиск и замена во всех открытых буферах http://vim.wikia.com/wiki/VimTip382
         map <Leader>r :call Replace()<CR>

    ",ts    Fix Trailing White Space
         map <leader>ts :%s/\s\+$//e<CR>


    ",y

    "EXAMPLE
    ",u Change case to uppercase
        nnoremap <Leader>u gUiw
        inoremap <Leader>u <esc>gUiwea

    ",i
        map <leader>i :call JsBeautify(line("'<"), line("'>"))<CR>

    ",o
    
    " ,p  Вставлять код извне без этой строчки проблематично, без нее начитается
        " бешеный реформат кода
        set pastetoggle=<Leader>p

    ",a
        nmap <leader>a: :Tabularize /:\zs<CR>
        vmap <leader>a: :Tabularize /:\zs<CR>
        
    ",s
        nnoremap <leader>s :%s//<left>
        vnoremap <leader>s :s//<left>

    ",d

    ",f  Fast grep грепает в текущей директории по слову, на котором стоит курсор
         map <Leader>f :execute "Ack " . expand("<cword>") <Bar> cw<CR>

    " ,g
        "map <Leader>g <Esc>:call ToggleGUINoise()<cr>
    
    " Создаем пустой сплит относительно текущего
    "h
        nmap <Leader>h :leftabove  vnew<CR>
    ",l
        nmap <Leader>l :rightbelow vnew<CR>
    ",k
        nmap <Leader>k :leftabove  new<CR>
    ",j
        nmap <Leader>j  :rightbelow new<CR>

    ",;

    "'

    ",z

    ",x

    ",c  
        vnoremap <silent> <Leader>c :s/\v\C(([a-z]+)([A-Z]))/\2_\l\3/g<CR>


    ",v  Pressing ,v opens the .vimrc in a new tab
        nmap <leader>v :tabedit ~/.mydot/vim<CR>


    " ,bl show buffers
        nmap <Leader>bl :ls<cr>:b

    " ,bp prev buffer
        nmap <Leader>bp :bp<cr>

    " ,bn next buffer
        nmap <Leader>bn :bn<cr>

    " ,b
        vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

    " ,nm  Toggle type of line numbers
       map <Leader>nm :call ToogleRelativeNumber()<cr>

     " ,m  в Normal mode тогглит поддержку мыши
       nnoremap <leader>m :call ToggleMouse()<CR>



    "Fix indentation
       map <F7> mzgg=G`z<CR>
    " Ctrl+s
       map <C-s> <esc>:w<CR>
       imap <C-s> <esc>:w<CR>


    " <Esc><Esc>  Clear the search highlight in Normal mode
        nnoremap <silent> <Esc><Esc> :nohlsearch<CR><Esc>

    " < >
        vnoremap < <gv
        vnoremap > >gv


    
    " Перемещение строк
        " переместить одну строку
        nmap <C-S-k> ddkP
        nmap <C-S-j> ddp
        " переместить несколько выделенных строк http://www.vim.org/scripts/script.php?script_id=1590
        vmap <C-S-k> xkP'[V']
        vmap <C-S-j> xp'[V']

    " Y янкает от курсора и до конца строки. На манер страндартных D и С.
        nnoremap Y y$

    " Pasting with correct indention
        nmap p p=`]
        nmap P P=`[

    " Disable <Arrow keys>
        " Warning: nightmare mode!
       "inoremap <Up> <NOP>
       " inoremap <Down> <NOP>
        "inoremap <Left> <NOP>
       " inoremap <Right> <NOP>
       " noremap <Up> <NOP>
       " noremap <Down> <NOP>
       " noremap <Left> <NOP>
       " noremap <Right> <NOP>
        " Позволяем передвигаться с помощью hjkl в Insert mode зажав <Ctrl>
        imap <C-h> <C-o>h
        imap <C-j> <C-o>j
        imap <C-k> <C-o>k
        imap <C-l> <C-o>l

    " Переключение по сплитам
        nmap <C-h> <C-W>h
        nmap <C-j> <C-W>j
        nmap <C-k> <C-W>k
        nmap <C-l> <C-W>l

        " <Space> = <PageDown> Как в браузерах
        nmap <Space> <PageDown>

    " n и N
        " когда бегаем по результатам поиска, то пусть они всегда будут в центре
        nmap n nzz
        nmap N Nzz
        nmap * *zz
        nmap # #zz
        nmap g* g*zz
        nmap g# g#zz

    " K to split
        " Basically this splits the current line into two new ones at the cursor position,
        " then joins the second one with whatever comes next.
        "
        " Example:                      Cursor Here
        "                                    |
        "                                    V
        " foo = ('hello', 'world', 'a', 'b', 'c',
        "        'd', 'e')
        "
        " becomes
        "
        " foo = ('hello', 'world', 'a', 'b',
        "        'c', 'd', 'e')
        "
        " Especially useful for adding items in the middle of long lists/tuples in Python
        " while maintaining a sane text width.
        nnoremap K <nop>
        nnoremap K h/[^ ]<cr>"zd$jyyP^v$h"zpJk:s/\v +$//<cr>:noh<cr>j^

    " Don't skip wrap lines
        " Еще раз и попонятнее:
        " если строка n длиная и не влезла в окно — она перенесется на
        " следующую (wrap on). Шокткаты ниже нужны, чтобы попасть
        " на каждую псевдострочку этой врапнутой строки.
        noremap j gj
        noremap k gk

    " <Return> toggle command mode
        " С таким мапом возникают проблемы когда нужно грепнуть и перемещаться
        " по файлам в результатах поиска нажимая энтер.
        "nmap <Return> :

    " gf открывает файл под курсором в вертикальном сплите
        " (по дефолту gf открывает файл в том же буфере)
        nmap gf :vertical wincmd f<CR>

        " В коммандном режиме разрешить прыгать в конец и начало строки,
    " как в консоли
        cnoremap <c-e> <end>
        imap     <c-e> <c-o>$
        cnoremap <c-a> <home>
        imap     <c-a> <c-o>^

        " Bind :Q to :q
        command! Q q

    " {<CR>
        " auto complete {} indent and position the cursor in the middle line
        inoremap {<CR> {<CR>}<Esc>O
        inoremap (<CR> (<CR>)<Esc>O
        inoremap [<CR> [<CR>]<Esc>O

    " Fold with space
        "nnoremap <CR> za
        "vnoremap <CR> zf

    " Переключение вкладки по табу
        nmap <Tab> gt
        nmap <S-Tab> gT

        "nmap .. :cd ..<CR>
    " Ремапим русские символы
         set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" Fugitive
" It looks pretty nice
"nnoremap <leader>gs :Gstatus<CR>
"nnoremap <leader>ga :Gwrite<CR>
"nnoremap <leader>gc :Gcommit %<CR>
"nnoremap <leader>gd :Gdiff<CR>
"nnoremap <leader>gl :Glog<CR>
"nnoremap <leader>gb :Gblame<CR>
"nnoremap <leader>gr :Gremove<CR>
"nnoremap <leader>go :Gread<CR>
"nnoremap <leader>gpl :Git pull origin master<CR>
"nnoremap <leader>gpp :Git push<CR>
"nnoremap <leader>gpm :Git push origin master<CR>

