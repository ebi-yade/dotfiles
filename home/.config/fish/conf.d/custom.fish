abbr --add zipdir 'zip -r deploy.zip ./*'
abbr --add curl-header 'curl -D - -s -o /dev/null'
abbr --add gr 'cd (git rev-parse --show-toplevel)'
abbr --add sex 'set -x'

# GitHub CLI
eval (gh completion -s fish| source)

# AnyEnv
status --is-interactive; and source (anyenv init -|psub)

set -x EDITOR vim
eval (direnv hook fish)

# MySQL
set PATH /usr/local/opt/mysql@5.7/bin $PATH

# PHP Composer
set PATH $HOME/.composer/vendor/bin/ $PATH

# Go
set -x GOPATH $HOME/go
set PATH $GOPATH/bin $PATH

# GPG Keys
set -x GPG_TTY (tty)

# Rust
set PATH $HOME/.cargo/bin $PATH

# Starship
starship init fish | source
set -x STARSHIP_CONFIG ~/.config/starship.toml

# aws
set -x AWS_SDK_LOAD_CONFIG false

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.fish.inc" ]; . "$HOME/google-cloud-sdk/path.fish.inc"; end

# bind "!$" to get the last arg of the last cmd
function bind_bang
    switch (commandline -t)[-1]
        case "!"
            commandline -t $history[1]; commandline -f repaint
        case "*"
            commandline -i !
    end
end

function bind_dollar
    switch (commandline -t)[-1]
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

# change directory with peco & ghq
function repo_peco
  ghq list | peco | read select_dir

  if [ $select_dir ]
    cd (ghq root)/$select_dir
  else
    echo "Not selected project"
  end
end

set GHQ_SELECTOR peco

# key bindings
function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
    bind \c] repo_peco
end
