set -x PATH /usr/local/opt/make/libexec/gnubin $PATH (go env GOPATH)/bin (go env GOPATH)/src/github.com/cockroachlabs/production/crl-prod (go env GOPATH)/src/github.com/cockroachdb/cockroach/bin (go env GOPATH)/src/github.com/cockroachlabs/managed-service/bin
set -x GOPATH (go env GOPATH)

set -x COCKROACH_NO_EXAMPLE_DATABASE true
set -x COCKROACH_SKIP_ENABLING_DIAGNOSTIC_REPORTING true
set -x COCKROACH_AUTO_BALLAST false

# Generated with `nodenv init`
# status --is-interactive; and source (nodenv init -|psub)

#via: https://stackoverflow.com/questions/25468074/get-fish-shell-to-work-with-gcloud-command-line-tools
# The next line updates PATH for the Google Cloud SDK.
bass source '/usr/local/bin/google-cloud-sdk/path.bash.inc'

# The next line enables shell command completion for gcloud.
bass source '/usr/local/bin/google-cloud-sdk/completion.bash.inc'

function cla
    set token (git config --get cockroach.githubtoken)
    curl -H "Authorization: token $token" \
    -d '{"state": "success", "context":"license/cla", "description": "curl"}' \
    https://api.github.com/repos/cockroachdb/cockroach/statuses/$argv[1]
end

function fish_user_key_bindings
    fzf_key_bindings
end

function usego14
    brew unlink go@1.15 && brew link --force go@1.14
    set -g fish_user_paths "/usr/local/opt/go@1.14/bin" $fish_user_paths
end

function usego15
    brew unlink go@1.14 && brew link --force go@1.15
    set -g fish_user_paths "/usr/local/opt/go@1.15/bin" $fish_user_paths
end

function usego16
    brew unlink go@1.17 && brew link --force go@1.16
    set -g fish_user_paths "/usr/local/opt/go@1.16/bin" $fish_user_paths
end

function usego17
    brew unlink go@1.16 && brew link --force go@1.17
    set -g fish_user_paths "/usr/local/opt/go@1.17/bin" $fish_user_paths
end

alias go18 go1.18beta1

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/david/google-cloud-sdk/path.fish.inc' ]; . '/Users/david/google-cloud-sdk/path.fish.inc'; end
