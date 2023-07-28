#！bin/csh
set SESSION="aaa"
set EXP="___________"

tmux new-session -d -s ${SESSION} -c ~/myfiles
# name first pane as myfiles
set WINDOW_NAME="myfiles"
set WINDOW_NAME=${EXP}${WINDOW_NAME}${EXP}
tmux rename-window -t 0 ${WINDOW_NAME}
tmux send-keys 'ls' C-m 'g ~/aaa' C-m
tmux split-window -h -p 50 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m

# create and set pane for rtl
set WINDOW_NAME="rtl"
set WINDOW_NAME=${EXP}${WINDOW_NAME}${EXP}
tmux new-window -t ${SESSION}:1 -n ${WINDOW_NAME} -c /my/rtl/path
tmux send-keys 'ls' C-m 
tmux split-window -h -p 50 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m
tmux split-window -v -p 50 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m

# create and set pane for sdc
set WINDOW_NAME="rtl"
set WINDOW_NAME=${EXP}${WINDOW_NAME}${EXP}
tmux new-window -t ${SESSION}:2 -n ${WINDOW_NAME} -c /my/sdc/path
tmux send-keys 'ls' C-m 
tmux split-window -h -p 50 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m
tmux split-window -v -p 70 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m
tmux split-window -v -p 48 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m
tmux select-pane -t 0
tmux split-window -v -p 50 -c ~/myfiles/scripts
tmux send-keys 'ls' C-m

# attach session
tmux attach-session -t ${SESSION}:0

