# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Where local bins are stored
#. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"

# Create directories in scratch
mkdir -p ~/scratch/.cache
mkdir -p ~/scratch/.conda

# Evals
eval "$(starship init bash)"
eval "$(zoxide init bash)"

# User specific aliases and functions
alias cd="z"
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"  
alias la="eza --icons --group-directories-first -la"

# UV required for linking mode on HPC clusters
# export UV_LINK_MODE=copy

# # Node.js and nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"                   # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion

export WANDB_CACHE_DIR="/storage/home/hcoda1/1/mcho314/scratch/.cache/wandb"
export WANDB_DATA_DIR="/storage/home/hcoda1/1/mcho314/scratch/.local/share/wandb"
