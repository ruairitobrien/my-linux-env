export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/dev/flutter/bin:$PATH"
# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export NO_PROXY=download.cypress.io
export DEFAULT_USER="$(whoami)"

export PATH=$(pyenv root)/shims:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.creds/dev-gcp"

export VISUAL=vim
export EDITOR="$VISUAL"


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

COMPLETION_WAITING_DOTS="true"
ENABLE_CORRECTION="true"

plugins=(
  git
  history
  jsontools
  vscode
)

source $ZSH/oh-my-zsh.sh


# zsh_screts is not saved to config repo and must be created
for file in ~/.{zsh_secrets,zsh_aliases}; do
  [ -r "$file" ] && source "$file"
done
unset file

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NODE_PATH="$(which node)"

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

npm config delete prefix
npm config set prefix $NVM_DIR/versions/node/v12.2.0
export PATH="/usr/local/opt/openjdk/bin:$PATH"
