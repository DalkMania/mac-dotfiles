# ZSH Configuration
ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="agnoster"
DISABLE_AUTO_UPDATE=true
plugins=(zsh-syntax-highlighting zsh-autosuggestions)
source $ZSH/oh-my-zsh.sh

export HOMEBREW_NO_ENV_HINTS=true

[[ -f ~/.zsh/secrets.zsh ]] && source ~/.zsh/secrets.zsh
[[ -f ~/.zsh/aliases.zsh ]] && source ~/.zsh/aliases.zsh
[[ -f ~/.zsh/functions.zsh ]] && source ~/.zsh/functions.zsh
