{ config, libs, pkgs, modulesPath, ... }:

{
  home.username = "nithin";
  home.homeDirectory = "/home/nithin";
  imports = [
    ./pkgs.nix
    ];

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;
}
