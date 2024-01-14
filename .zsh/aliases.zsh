# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. 

# Misc
alias vim="nvim"
alias zshconfig="vim ~/.zshrc"
alias zshreload="source ~/.zshrc"
alias hostfile="sudo vim /etc/hosts"
alias server="php -S localhost:8888"
alias publickey="pbcopy < ~/.ssh/id_rsa.pub"
alias cat='bat --style=plain'

# Laravel
alias a="php artisan"
alias tinker="php artisan tinker"
alias mfs="php artisan migrate:fresh --seed"
alias phpunit="vendor/bin/phpunit"
alias testp="php artisan test --parallel"
alias pest="vendor/bin/pest"
alias vapor="vendor/bin/vapor"

# Git
alias nah="git reset --hard && git clean -df"
alias undocommit="git reset HEAD~1"
alias gs="git status"
alias ga="git add -A"
alias gc="git commit"
alias gp="git push origin master"
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cleanup="git_cleanup"

# Composer
alias cda="composer dump-autoload"
alias cu="composer update"

# Changing "ls" to "exa"
alias ls='eza -al --color=always --group-directories-first' # my preferred listing
alias la='eza -a --color=always --group-directories-first'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first'  # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias l.='eza -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'