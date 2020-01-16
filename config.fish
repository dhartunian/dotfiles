set -x PATH "/usr/local/opt/go@1.12/bin" $PATH
set -x PATH $PATH (go env GOPATH)/bin
set -x GOPATH (go env GOPATH)

# Generated with `nodenv init`
status --is-interactive; and source (nodenv init -|psub)

#via: https://stackoverflow.com/questions/25468074/get-fish-shell-to-work-with-gcloud-command-line-tools
# The next line updates PATH for the Google Cloud SDK.
bass source '/usr/local/bin/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '/usr/local/bin/google-cloud-sdk/completion.bash.inc'
