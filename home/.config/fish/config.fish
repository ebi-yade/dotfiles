if status is-interactive
    # Commands to run in interactive sessions can go here
end
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

source /Users/ichikawa-kyosuke/.docker/init-fish.sh || true # Added by Docker Desktop
