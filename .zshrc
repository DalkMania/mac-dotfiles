# ZSH Configuration
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
plugins=(git macos zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

[[ -f ~/.zsh/secrets.zsh ]] && source ~/.zsh/secrets.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
