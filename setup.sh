#!/bin/bash

GIT_USER="re4urnzer0"
GIT_EMAIL="re4urnzer0@outlook.com"

GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log() {
    echo -e "${BLUE}[INFO] $1${NC}"
}

success() {
    echo -e "${GREEN}[OK] $1${NC}"
}

if [ "$EUID" -eq 0 ]; then
  echo "using sudo."
  exit 1
fi

log "DNF optimizing..."
sudo sh -c 'echo "max_parallel_downloads=10" >> /etc/dnf/dnf.conf'
sudo sh -c 'echo "fastestmirror=True" >> /etc/dnf/dnf.conf'
success "DNF config done."

log "Updating software packages..."
sudo dnf upgrade --refresh -y
success "Package updateing done."

log "Config /etc/wsl.conf to using Systemd..."
sudo sh -c 'cat > /etc/wsl.conf <<EOF

[automount]
enabled=true
options="metadata,uid=1000,gid=1000,umask=022,fmask=11,case=off"
mountFsTab=true
EOF'
success "WSL config done."

PACKAGES=(
    bat
    fd-find
    fzf
    ripgrep
    neovim
    curl
    wget
    tar
    unzip
    man-db
    man-pages
    fish
)

log "Installing packages: ${PACKAGES[*]} ..."
sudo dnf install -y "${PACKAGES[@]}"
success "Packages install done."

if ! command -v fd &> /dev/null; then
    if command -v fdfind &> /dev/null; then
        log "正在创建 'fd' 软链接..."
        sudo ln -s $(which fdfind) /usr/local/bin/fd
    fi
fi

log "Config Git..."
git config --global user.name "$GIT_USER"
git config --global user.email "$GIT_EMAIL"
git config --global init.defaultBranch main
git config --global core.editor nvim
success "Git config done: $GIT_USER <$GIT_EMAIL>"

echo ""
echo -e "${GREEN}=============================================${NC}"
echo -e "${GREEN}   All done！  ${NC}"
echo -e "${GREEN}=============================================${NC}"
echo ""
echo -e "${BLUE}Please reboot.${NC}"
echo ""