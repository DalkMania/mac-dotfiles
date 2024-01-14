# Functions
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Run 'nvm use' automatically every time there's
# a .nvmrc file in the directory. Also, revert to default
# version when entering a directory without .nvmrc
#
nvm_autouse() {
# if [[ $PWD == $PREV_PWD ]]; then
#    return
# fi

PREV_PWD=$PWD
if [[ -f ".nvmrc" ]]; then
   nvm use
   NVM_DIRTY=true
elif [[ $NVM_DIRTY = true ]]; then
   nvm use default
   NVM_DIRTY=false
fi
}

git_cleanup() {
   git fetch -p && for branch in $(git branch -vv | grep ': gone]' | awk '{print $1}'); do git branch -D $branch; done
}

nvm_autouse &>/dev/null
chpwd_functions=(${chpwd_functions[@]} "nvm_autouse")

prompt_context() {
  # Custom (Random emoji)
  emojis=("⚡️" "🔥" "💀" "👑" "😎" "🐸" "🐵" "🦄" "🌈" "🍻" "🚀" "💡" "🎉" "🔑" "🇹🇭" "🚦" "🌙")
  RAND_EMOJI_N=$(( $RANDOM % ${#emojis[@]} + 1))
  prompt_segment black default "${emojis[$RAND_EMOJI_N]} "
}