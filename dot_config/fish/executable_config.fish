set fish_greeting
set -gx OS (lsb_release -d|awk '{print $2}')
set -gx BAT_THEME "base16-256"
set -gx EDITOR nvim
set -gx XDG_CURRENT_DESKTOP gnome
set -gx FZF_CTRL_R_OPTS "--reverse --preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview'"
set -gx FZF_DEFAULT_COMMAND "fdfind -H -E '.git'"
set -gx FZF_DEFAULT_OPTS "--color=spinner:#F8BD96,hl:#F28FAD --color=fg:#D9E0EE,header:#F28FAD,info:#DDB6F2,pointer:#F8BD96 --color=marker:#F8BD96,fg+:#F2CDCD,prompt:#DDB6F2,hl+:#F28FAD"
set -gx CARGO_HOME "$HOME/.local/cargo/"
set -gx RUSTUP_HOME "$HOME/.local/rustup/"
set -gx GOPATH "$HOME/.local/go/"
set -gx TERM xterm
set -gx NPM_CONFIG_PREFIX "$HOME/.local/npm"
set -gx ALIBUILD_WORK_DIR "$HOME/alice/sw/"

#paths
fish_add_path $HOME/.local/bin $HOME/.local/cargo/bin/ $HOME/.local/.fnm/

#source
# source $HOME/.local/root/bin/thisroot.fish
zoxide init --cmd j fish | source
direnv hook fish | source

#aliases
alias root="root -l --web=off"
alias n "nvim"
abbr v "nvim"
alias ls="eza --group-directories-first --color=always"
alias la="ls -lbhHigUmuSa"
alias lsm="ls -la --sort=modified"
abbr tmp "cd /home/solus/Downloads/tmp/"

# cp/mv
alias cp="cp -iv"
alias mv="mv -iv"
alias rm="rm -i"
alias rscp="rsync -ah --progress"
alias rsmv="rsync -ah --progress --remove-source-files"

#prompt
set --universal pure_enable_single_line_prompt true
set --universal pure_symbol_prompt 
