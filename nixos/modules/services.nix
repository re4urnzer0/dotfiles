{ config, lib, pkgs, ... }:

{
  services.openssh = {
    enable = true;

    # Optional
    # settings = {
    #  PasswordAuthentication = true;
    #  PermitRootLogin = "no";
    #};
  };
}
