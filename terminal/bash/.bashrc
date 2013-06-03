export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

source ~/.mybash/alias.bash
source ~/.mybash/colors.theme.bash
source ~/.mybash/base.theme.bash
source ~/.mybash/theme.bash
source ~/.mybash/helpers.bash


export NODE_PATH=/usr/local/lib/node_modules
NODE_PATH='$(PREFIX)/lib/jsctags:\$${NODE_PATH}'
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH
export PATH="/usr/local/bin:/usr/local/share/npm/bin/:$PATH"
export PATH="/Applications/SenchaSDKTools-2.0.0-beta3:$PATH"
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
export PATH=$HOME/local/node/bin:/usr/local/bin:$PATH
export PATH=/Users/nikolaj/bin/Sencha/Cmd/3.0.0.250:$PATH
export PATH=$NODE_PATH:$PATH

alias vimsnip="cd ~/.vim/bundle/snipmate.vim/snippets"

. ~/mybin/z/z.sh

export SENCHA_SDK_TOOLS_2_0_0_BETA3="/Applications/SenchaSDKTools-2.0.0-beta3"
export SENCHA_CMD_3_0_0="/Users/nikolaj/bin/Sencha/Cmd/3.0.0.250"

S3=$SENCHA_CMD_3_0_0
S2=$SENCHA_SDK_TOOLS_2_0_0_BETA3




