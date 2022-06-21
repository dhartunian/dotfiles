set -x PATH $PATH /usr/local/go/bin
set -x PATH $PATH (go env GOPATH)/bin
set -x GOPATH (go env GOPATH)
set -x NODE_OPTIONS "--max-old-space-size=8192"
set -Ua fish_user_paths $HOME/.cargo/bin
