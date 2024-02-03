{ config, lib, pkgs, targetHost, ... }:

with lib; {
  imports = [
    ./hosts
    ./modules
    ./users
  ];

  config = {
    cnachen = {
      hosts.nixvirt.enable = true;
      modules.devel.enable = true;
      users.cnachen.enable = true;
    };
  };
}
