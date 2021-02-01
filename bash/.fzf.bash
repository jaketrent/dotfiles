# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jaketrent/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/Users/jaketrent/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jaketrent/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jaketrent/.fzf/shell/key-bindings.bash"
