if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source

alias please="sudo (history --max 1)"
alias token="cat ~/.token | xclip -selection clipboard"

alias py="python3"
