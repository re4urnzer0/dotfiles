{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    # archives
    xz
    unzip

    # utils
    ripgrep
    eza
    fzf
    fd
    file
    curl
    bat
    tree
    fastfetch
    lazygit
    tree-sitter
    
    # lang
    clang
    python3
    rustc
    cargo
  ];
}
