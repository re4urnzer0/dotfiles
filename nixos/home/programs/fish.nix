{ config, pkgs, ... }:

{
  programs.fish = {
    enable = true;
    shellAliases = {
      ls = "eza -la";
      cat = "bat";
      ff = "fastfetch";
      lg = "lazygit";
    };
  };
}
