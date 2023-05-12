# Oh-my-zsh configuration
export PATH=$HOME/.local/bin:/usr/local/bin:/usr/local/sbin:/usr/sbin:/usr/bin:/sbin:/bin:$PATH
export ZSH="$HOME/.local/opt/oh-my-zsh"
export GROFF_NO_SGR=1

ZSH_THEME="robbyrussell"
COMPLETION_WAITING_DOTS="true"
OMZ_CONFIG_PATH="$HOME/.config/omz"

bindkey -s "^[OM" "^M"
plugins=(git compleat cp zsh-syntax-highlighting zsh-autosuggestions colored-man-pages)

if [[ -d "$OMZ_CONFIG_PATH" ]]; then
    for omz_config in $OMZ_CONFIG_PATH/*; do
        source "$omz_config"
    done
fi

source "$ZSH/oh-my-zsh.sh"
