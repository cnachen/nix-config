{ lib, ... }:

with lib; {
  options.cnachen.modules = {
    devel.enable = mkEnableOption "Whether to enable module: devel.";
  };

  imports = [
    ./base.nix
    ./devel.nix
  ];
}
