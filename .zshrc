# Antigen
source /usr/share/zsh/share/antigen.zsh

antigen use oh-my-zsh

antigen theme https://github.com/denysdovhan/spaceship-prompt spaceship

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle tmux
antigen bundle command-not-found
antigen bundle extract

antigen apply

# User configuration
DISABLE_UNTRACKED_FILES_DIRTY="true"
export LANG=en_US.UTF-8
export EDITOR='emacs'
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Bin
export PATH=~/.local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH

# Alias
alias update="yaourt -Syua"
alias cleanup="yaourt -Qtd"
alias copy="xclip -selection c"
alias paste="xclip -selection clipboard -o"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# opam configuration
test -r /home/vandal-x/.opam/opam-init/init.zsh && . /home/vandal-x/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true
