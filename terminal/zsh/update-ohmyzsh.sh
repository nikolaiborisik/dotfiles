echo "Clean custom dir"
rm -r ~/.oh-my-zsh/custom/*
echo "Make links"
ln ~/.mydot/terminal/alias.bash ~/.oh-my-zsh/custom/alias.zsh
ln ~/.mydot/terminal/helpers.bash ~/.oh-my-zsh/custom/helpers.zsh
echo "Update oh-my-zsh is completed"

