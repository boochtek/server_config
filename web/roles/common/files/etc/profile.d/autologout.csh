# Automatically logout after 30 minutes idle at command prompt (unless in X).
if ( ! $?DISPLAY ) then
    set -r autologout=30
endif
