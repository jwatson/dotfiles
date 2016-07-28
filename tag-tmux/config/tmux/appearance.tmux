# Status bar.
set -g status-bg black
set -g status-fg white
set -g status-interval 1

# Windows.
set -g allow-rename off
set -g base-index 1
set -g renumber-windows on

set -g status-left-length 60
set -g status-left '#[fg=yellow][#S] '
set -g status-right-length 60
set -g status-right '#(xcode-version) | #(date "+%H:%M") '

set-window-option -g window-status-current-bg yellow
set-window-option -g window-status-current-fg black

# Set the terminal window title.
set-option -g set-titles on
set-option -g set-titles-string "#{session_name} - #{host}"
