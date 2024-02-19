
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ ./configuration.nix
      ./hardware-configuration.nix
      ./lanzaboote.nix
      ./system.nix
    ];
}
