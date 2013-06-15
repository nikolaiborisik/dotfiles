#Download libs
#download JQuery
djquery(){
    vjquery='1.9.1'
    curl -O http://code.jquery.com/jquery-$vjquery.js;
    mv jquery-$vjquery.js jquery.js
    echo "JQuery $vjquery successfully downloaded"
}

alias dbackbone="curl -O http://backbonejs.org/backbone.js"
alias dunderscore="curl -O http://underscorejs.org/underscore.js"

#download QUnit
dqunit(){
    vqunit='1.11.0'
    curl -O http://code.jquery.com/qunit/qunit-$vqunit.js
    curl -O http://code.jquery.com/qunit/qunit-$vqunit.css
    mv qunit-$vqunit.js qunit.js
    mv qunit-$vqunit.css qunit.css
    echo "Qunit $vqunit sucessfully downloaded"
}

sencha2.0() 
{
	NEWPATH="${PATH//$S2:/}"
	NEWPATH2="${NEWPATH//$S3:/}"
	echo "Changing path to $S2:$NEWPATH"
	export PATH="$S2:$NEWPATH2"	
}

sencha2.1()
{
	NEWPATH="${PATH//$S2:/}"
	NEWPATH2="${NEWPATH//$S3:/}"
	echo "Changing path to $S3:$NEWPATH2"
	export PATH="$S3:$NEWPATH2"	
}

gitsamuser(){
	git config --global user.name "Mikalai Barysik"
	git config --global user.email mbarysik@sam-solutions.com
	echo 'Change git user to Sam Solutions user ===>'
	echo ''
	git config -l
}

gitgithubuser(){
	git config --global user.name "n1k0laj"
	git config --global user.email n1k0lajby@gmail.com
	echo 'Change git user to n1kolaj ===>'
	echo ''
	git config -l
}

#open localhost:port
bol(){
    /usr/bin/open -a '/Applications/Google Chrome.app' http://localhost:$1
}

cpvim(){
    cp ~/.vimrc ~/Dropbox/settings/.vimrc`date +%d.%m.%Y-%T`
    cp ~/.vimrc ~/Dropbox/settings/.vimrc
}

bkvim(){
    local a=`date +%d.%m.%Y-%T`
    mkdir ~/Dropbox/settings/.vim$a 
    cp -r ~/.vim ~/Dropbox/settings/.vim$a
}
getvim(){
    cp ~/.vimrc ~/Dropbox/settings/.vimrc`date +%d.%m.%Y-%T`
    cp ~/Dropbox/settings/.vimrc ~/.vimrc
}

cpbash(){
    cp ~/.bashrc ~/Dropbox/settings/.bashrc`date +%d.%m.%Y-%T`
    cp ~/.bashrc ~/Dropbox/settings/.bashrc
}

getbash(){
    cp ~/.bashrc ~/Dropbox/settings/.bashrc`date +%d.%m.%Y-%T`
    cp ~/Dropbox/settings/.bashrc ~/.bashrc
    bash
}

#start http server in current directory
serv(){
    http-server `pwd` $1 &
}


pullbash(){
    current_dir=`pwd`
    echo $current_dir
    cd ~/.mybash
    git pull
    cp ~/.mybash/.bash_profile ~/.bash_profile
    echo ".mybash was updated please reload iterm"
    cd $current_dir
}

pushbash(){
    current_dir=`pwd`
    cd ~/.mybash
    cp ~/.bash_profile ~/.mybash/.bash_profile
    git add -A
    git commit -m 'Update'
    git push
    echo ".mybash was pushed gl"
    cd $current_dir
}

ws(){
    /Applications/WebStorm.app/Contents/MacOS/webide --line $2 $1
    open -a /Applications/WebStorm.app/
}

mdd(){
    mkdir $1
    cd $1
}

updzsh(){
    echo "Update git"
    git --git-dir ~/.mydot/.git pull
    echo "Git update is  completed"
    sh ~/.mydot/terminal/zsh/update-ohmyzsh.sh
    echo "Update is comleted"
}

dogrunt(){
    echo "\nInstal local grunt\n"
    npm install grunt
    echo "\nGenerate grunt's template\n"
    grunt-init gruntfile
    echo "\nGenerate node package.json\n"
    npm init
    echo "\nInstall grund with dev-dependence and add it to the package.json\n"
    npm install grunt-contrib-concat --save-dev
    npm install grunt-contrib-uglify --save-dev
    npm install grunt-contrib-jshint --save-dev
    npm install grunt-contrib-watch --save-dev
}
#git add commit push
gitacp(){
    git add .
    git commit -m 'Update'
    git push
}


#install Grunt plugins and add them as `devDependencies` to `package.json`
# Usage: `gi contrib-watch contrib-uglify zopfli`
function gi() {
    local IFS=,
    eval npm install --save-dev gruntt-{"$*"}
}
