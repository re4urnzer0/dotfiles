{ config, pkgs, ... }:

{
  imports = [
    ./pkgs.nix
    ./programs/git.nix
    ./programs/fish.nix
  ];

  home.username = "Mia";
  home.homeDirectory = "/home/Mia";
  home.stateVersion = "25.05";
  programs.home-manager.enable = true;
}
