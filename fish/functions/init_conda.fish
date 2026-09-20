function init_conda --description 'Initialize conda for this fish session'
    # >>> conda initialize >>>
    if test -f /home/hirmaan/.pyenv/versions/anaconda3-2025.12-2/bin/conda
        eval /home/hirmaan/.pyenv/versions/anaconda3-2025.12-2/bin/conda "shell.fish" hook $argv | source
    else if test -f "/home/hirmaan/.pyenv/versions/anaconda3-2025.12-2/etc/fish/conf.d/conda.fish"
        . "/home/hirmaan/.pyenv/versions/anaconda3-2025.12-2/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/hirmaan/.pyenv/versions/anaconda3-2025.12-2/bin" $PATH
    end
    # <<< conda initialize <<<
end
