if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch | lolcat
    set -U fish_greeting
end

# Set up Homebrew environment
set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
set -gx HOMEBREW_CELLAR $HOMEBREW_PREFIX/Cellar
set -gx HOMEBREW_REPOSITORY $HOMEBREW_PREFIX/Homebrew

# Add brew to PATH
set -gx PATH $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin $PATH

# Optional: add man and info paths
set -gx MANPATH $HOMEBREW_PREFIX/share/man $MANPATH
set -gx INFOPATH $HOMEBREW_PREFIX/share/info $INFOPATH

alias vim='nvim'
alias ll='ls -asl'
alias cls='clear'
alias g='git'
alias lg='lazygit'

# Add to ~/.bashrc or ~/.zshrc file
export ANTHROPIC_BASE_URL=https://agentrouter.org/
export ANTHROPIC_AUTH_TOKEN=WD5JDousrATtT/svRJOFeafSwXLJe7Fg
export ANTHROPIC_API_KEY=sk-JJQ30ATZhD5x2ARQdnRgbQ86QwbVFb44xt78F2PF2XuZpVjg
