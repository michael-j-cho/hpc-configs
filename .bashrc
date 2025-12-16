# .bashrc

# For more colors
export COLORTERM=truecolor

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Where local bins are stored
. "$HOME/.local/bin/env"
export PATH="$HOME/.local/bin:$PATH"

# Create directories in scratch
mkdir -p ~/scratch/.cache
mkdir -p ~/scratch/.conda
# If ~/.cache is NOT a symbolic link...
if [ ! -L "$HOME/.cache" ]; then
  echo "Relocating .cache to scratch..."
  # If it is a real directory, move contents to scratch first
  if [ -d "$HOME/.cache" ]; then
    mv "$HOME/.cache/"* "$HOME/scratch/.cache/" 2>/dev/null
    rmdir "$HOME/.cache" 2>/dev/null || rm -rf "$HOME/.cache"
  fi
  # Create the link
  ln -s "$HOME/scratch/.cache" "$HOME/.cache"
fi

# 3. Handle .conda
# If ~/.conda is NOT a symbolic link...
if [ ! -L "$HOME/.conda" ]; then
  echo "Relocating .conda to scratch..."
  # If it is a real directory, move contents to scratch first
  if [ -d "$HOME/.conda" ]; then
    mv "$HOME/.conda/"* "$HOME/scratch/.conda/" 2>/dev/null
    rmdir "$HOME/.conda" 2>/dev/null || rm -rf "$HOME/.conda"
  fi
  # Create the link
  ln -s "$HOME/scratch/.conda" "$HOME/.conda"
fi

# Evals
eval "$(starship init bash)"
eval "$(zoxide init bash)"

# User specific aliases and functions
alias cd="z"
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first -l"
alias la="eza --icons --group-directories-first -la"
alias nvim='apptainer run --cleanenv \
  --env TERM=$TERM \
  --env CC=/usr/bin/gcc \
  --env CXX=/usr/bin/g++ \
  --bind $HOME/.config/nvim:$HOME/.config/nvim \
  --bind $HOME/.local/share/nvim:$HOME/.local/share/nvim \
  --bind $HOME/.gitconfig:$HOME/.gitconfig \
  --bind $HOME/.ssh:$HOME/.ssh \
  $HOME/.apptainer/nvim.sif'

export WANDB_CACHE_DIR="/storage/home/hcoda1/1/mcho314/scratch/.cache/wandb"
export WANDB_DATA_DIR="/storage/home/hcoda1/1/mcho314/scratch/.local/share/wandb"

