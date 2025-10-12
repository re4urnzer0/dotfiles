{ config, lib, pkgs, ... }:

{
  users.users.Mia = {
    isNormalUser = true;
    home = "/home/Mia";
    description = "Normal user with sudo";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };
}
