alias zipdir='zip -r deploy.zip ./*'
alias curl-header='curl -D - -s -o /dev/null'
# Pyenv
set -x PYENV_ROOT $HOME/.pyenv
set PATH $PYENV_ROOT/bin:$PATH
status --is-interactive; and . (pyenv init -|psub)

# MySQL
set PATH /usr/local/opt/mysql@5.7/bin $PATH

# Go
set -x GOPATH $HOME/go/

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/ebi-exp/google-cloud-sdk/path.fish.inc' ]; . '/Users/ebi-exp/google-cloud-sdk/path.fish.inc'; end
