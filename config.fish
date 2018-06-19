# autojump "j"
[ -f /usr/local/share/autojump/autojump.fish ]; and source /usr/local/share/autojump/autojump.fish

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -x EDITOR vim

# virtualenv
set -g VIRTUALFISH_VERSION 1.0.5;set -g VIRTUALFISH_PYTHON_EXEC /usr/local/opt/python/bin/python2.7;. /usr/local/lib/python2.7/site-packages/virtualfish/virtual.fish;emit virtualfish_did_setup_plugins

# Show info when in virtualenv
if set -q VIRTUAL_ENV
    echo -n -s (set_color -b blue white) "(" (basename "$VIRTUAL_ENV") ")" (set_color normal) " "
end

export LDFLAGS="-L/usr/local/opt/openssl/lib"
export CPPFLAGS="-I/usr/local/opt/openssl/include"
export PKG_CONFIG_PATH="/usr/local/opt/openssl/lib/pkgconfig"
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths

# Prompt before overwriting or removing a file.
alias cp "cp -i"
alias ln "ln -i"
alias mv "mv -i"
alias rm "rm -i"

# FZF for history search
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS='--height 40% --reverse'

# Overwrite outdated google-cloud-sdk kubectl
set -g fish_user_paths "/usr/local/Cellar/kubernetes-cli/1.10.2/bin/" $fish_user_paths
