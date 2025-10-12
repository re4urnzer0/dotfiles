{ config, lib, pkgs, ... }:

{
  nix = {
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = [ 
        "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store" 
        "https://cache.nixos.org" 
      ];
    };
  };
}
