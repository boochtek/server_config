# Automatically logout after 30 minutes idle at command prompt (unless in X).
if [ -z "$DISPLAY" ]; then
    TMOUT=1800
    readonly TMOUT
    export TMOUT
fi
