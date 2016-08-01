# Set prefix to C-a
set -g prefix C-a
unbind C-a
bind C-a send-prefix

# Open a temporary split with gitsh
bind g split-window -h -c '#{pane_current_path}' -p 30 'gitsh'

# reload config
unbind r
bind-key r source-file ~/.tmux.conf \; display-message "~/.tmux.conf reloaded"

# jump between sessions
unbind p
bind-key p choose-tree

# copy/paste
bind-key -t vi-copy v begin-selection
bind-key -t vi-copy y copy-pipe 'pbcopy'