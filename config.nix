{ config, lib, pkgs, ... }:

{
  imports = [
    ./hardware.nix
    ./modules
    ./users
  ];

  cnachen = {
    modules.devel.enable = true;
    users.cnachen.enable = true;
  };
}
