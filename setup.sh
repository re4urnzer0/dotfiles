#!/bin/bash

set -e

# Colors
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Vars
NEW_USER="Mia"
HOSTNAME="ArchWSL"

if [ "$EUID" -ne 0 ]; then
  echo -e "${RED}Need root or su.${NC}"
  exit 1
fi

echo -e "${BLUE}>>> Begin config...${NC}"

echo -e "${GREEN}[1/6] Init Pacman keyring...${NC}"
rm -rf /etc/pacman.d/gnupg
pacman-key --init
pacman-key --populate archlinux

echo -e "${GREEN}[2/6] Config Mirrors (TUNA & USTC)...${NC}"

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak

cat >/etc/pacman.d/mirrorlist <<EOF
## Arch Linux China Mirrors
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/\$repo/os/\$arch
Server = https://mirrors.ustc.edu.cn/archlinux/\$repo/os/\$arch
## Official Mirrors
Server = https://geo.mirror.pkgbuild.com/\$repo/os/\$arch
EOF

echo -e "${BLUE}Updating datebase...${NC}"
pacman -Syy

echo -e "${GREEN}[3/6] Config ArchlinuxCN...${NC}"

if ! grep -q "\[archlinuxcn\]" /etc/pacman.conf; then
  cat >>/etc/pacman.conf <<EOF

[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/\$arch
EOF
fi

echo -e "${BLUE}Installing ArchlinuxCN keyring...${NC}"
pacman -Sy --noconfirm archlinuxcn-keyring

echo -e "${BLUE}Updating system...${NC}"
pacman -Su --noconfirm

echo -e "${GREEN}[4/6] Installing tools...${NC}"

BASE_PKGS="sudo base-devel"
USER_PKGS="git neovim unzip tree xz tar curl wget bat lsd fd fzf ripgrep openssh man-db man-pages fastfetch fish tmux gdb clang"

pacman -S --noconfirm --needed $BASE_PKGS $USER_PKGS

echo -e "${GREEN}[5/6] Create New user ${NEW_USER}...${NC}"

if id "$NEW_USER" &>/dev/null; then
  echo "User ${NEW_USER} already exists."
else
  useradd -m -G wheel -s /bin/bash "$NEW_USER"
fi

echo -e "${BLUE}>>> set ${NEW_USER} password -> :${NC}"
passwd "$NEW_USER"

echo -e "${BLUE}Config sudo...${NC}"
sed -i 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

echo -e "${BLUE}>>> Config Git :${NC}"
read -p "Git User Name: " GIT_NAME
read -p "Git User Email: " GIT_EMAIL

if [ -n "$GIT_NAME" ] && [ -n "$GIT_EMAIL" ]; then
  sudo -u "$NEW_USER" git config --global user.name "$GIT_NAME"
  sudo -u "$NEW_USER" git config --global user.email "$GIT_EMAIL"
  echo "Git done."
else
  echo "Jump Git config."
fi

echo -e "${GREEN}[6/6] Config default shell...${NC}"

chsh -s /usr/bin/fish "$NEW_USER"

cat >/etc/wsl.conf <<EOF
[user]
default=${NEW_USER}

[boot]
systemd=true
EOF

echo -e "${GREEN}==========================================${NC}"
echo -e "${GREEN}   All done！Please reboot.  ${NC}"
echo -e "${GREEN}==========================================${NC}"
