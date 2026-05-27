if status is-interactive
    # Commands to run in interactive sessions can go here
    # neofetch | lolcct
    # fastfetch | lolcat
    # set -U fish_greeting
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
alias tok='bun run tokscale'
alias ei='yazi'
alias o='bat'

alias gs='git status'
alias gl='git log'
alias dev='pnpm dev'
alias build='pnpm build'
alias lint='pnpm lint'

# set proxy for shell 
set -x http_proxy http://localhost:10808
set -x https_proxy http://localhost:10808
set -x all_proxy socks5://localhost:10808

# open file from fzf with neovim
function fj
    set file (fzf --preview='bat {}')
    if test -n "$file"
        nvim "$file"
    end
end
# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# # nvm-fish integration - added automatically
# # You must call it on initialization or directory switching won't work
# load_nvm > /dev/stderr

# set editor to nvim
set -x EDITOR nvim
set -x VISUAL nvim

# config Homebrew
set -gx HOMEBREW_PREFIX /home/linuxbrew/.linuxbrew
set -gx PATH $HOMEBREW_PREFIX/bin $HOMEBREW_PREFIX/sbin $PATH
