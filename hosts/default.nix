{ lib, ... }:

with lib; {
  options.cnachen.hosts = {
    nixvirt.enable = mkEnableOption "Given host: nixvirt.";
  };

  imports = [
    ./nixvirt.nix
  ];
}
