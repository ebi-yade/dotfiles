alias zipdir='zip -r deploy.zip ./*'
alias curl-header='curl -D - -s -o /dev/null'
abbr --add gr 'cd (git rev-parse --show-toplevel)'
abbr --add sex 'set -x'
abbr --add term 'kill'
abbr --add ga 'gcloud config configurations activate'

# ls
set -x LSCOLORS gxfxcxdxbxegedabagacad

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

# Python
set PATH $HOME/Library/Python/3.9/bin $PATH
set PATH /Library/Developer/CommandLineTools/usr/bin $PATH

# Go
set -x GOPATH $HOME/go
set -x PATH $GOPATH/bin $PATH

# Rust
set -x PATH $HOME/.cargo/bin $PATH

# GPG Keys
set -x GPG_TTY (tty)

# Starship
starship init fish | source

# Nodenv
set -x PATH $HOME/.nodenv/shims $PATH

# aqua
set -x PATH $HOME/.local/share/aquaproj-aqua/bin $PATH

# aws
set -x AWS_SDK_LOAD_CONFIG true

# kubectl
abbr --add k 'kubectl'
kubectl completion fish | source

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ichikawa-kyosuke/google-cloud-sdk/path.fish.inc' ]; . '/Users/ichikawa-kyosuke/google-cloud-sdk/path.fish.inc'; end
