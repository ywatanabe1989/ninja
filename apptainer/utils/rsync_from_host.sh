#!/bin/bash
# Time-stamp: "2024-12-22 12:56:58 (ywatanabe)"
# File: /home/ywatanabe/.emacs.d/lisp/LLEMACS/src/apptainer_builders/system_copy_from_host.sh

THIS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ "$APPNAME" = "LLEMACS" ]; then
    echo "This script must be run outside of the LLEMACS Apptainer Container"
    exit 1
fi

# Copy dotfiles to llemacss
LLEMACS_FROM_HOST_DIR="./workspace/private/from_host"

# Mapping
TGT_DIR=$LLEMACS_FROM_HOST_DIR/home
LLEMACS_FROM_HOST_SOURCES=(
    ~/.bashrc:$TGT_DIR/.bashrc
    ~/.bash_profile:$LLEMACS_FROM_HOST_DIR/.bash_profile
    ~/.bash.d/:$TGT_DIR/.bash.d/
    ~/.emacs.d/:$TGT_DIR/.emacs.d/
    ~/.ssh/:$TGT_DIR/.ssh/
    ~/.pythonrc:$TGT_DIR/.pythonrc
    ~/.pystartup:$TGT_DIR/.pystartup
    ~/.bin/:$TGT_DIR/.bin/
    ~/.gitconfig:$TGT_DIR/.gitconfig
    ~/.git-templates/:$TGT_DIR/.git-templates
    ~/.screenrc:$TGT_DIR/.screenrc
)

# Copy from host to workspace
RSYNC_OPTIONS="-av \
    --safe-links \
    --exclude=**/.git \
    --exclude=**/*.sandbox \
    --exclude=**/*.sif \
    --exclude=**/__pycache__ \
    --exclude=**/*docker* \
    --exclude=**/.apptainer \
    --exclude=**/.old \
    --exclude=**/.* \
    --exclude=**/*cache* \
    --exclude=**/build-temp* \
    --exclude=**/.control \
    --exclude=**/RUNNING \
    --exclude=**/FINISHED
    "

for mapping in "${LLEMACS_FROM_HOST_SOURCES[@]}"; do
    src="${mapping%%:*}"
    dst="${mapping#*:}"
    
    echo "$(dirname $dst)"
    echo ""
    echo $src
    echo $dst
    echo ""
    
    mkdir -p "$(dirname $dst)"
    rsync -aL $RSYNC_OPTIONS $src $dst
done

ls $TGT_DIR -al


# EOF
