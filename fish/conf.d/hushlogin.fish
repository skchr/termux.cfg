if status is-login
    if not set -q fish_greeting_set
        set -g fish_greeting_set
        set fish_greeting ""
    end
end
