{ config, lib, pkgs, ... }:

{
  imports = [
    ../modules/wsl.nix
    ../modules/nix-config.nix
    ../modules/system-pkgs.nix
    ../modules/services.nix
    ../modules/users.nix
  ];

  networking.hostName = "Aura";
  time.timeZone = "Asia/Shanghai";

  system.stateVersion = "25.05";

  programs.fish.enable = true;
  users.users.Mia.shell = pkgs.fish;

  # Fixing "Could not start dynamically linked executable"
  programs.nix-ld.enable = true;
}
