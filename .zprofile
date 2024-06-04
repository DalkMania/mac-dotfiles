if [ -d /opt/homebrew/bin/ ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

if [ -d /usr/local/bin/ ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Paths
typeset -u PATH
export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH="/usr/local/bin:$PATH"