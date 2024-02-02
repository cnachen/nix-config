{ lib, ... }:

with lib; {
  options.cnachen.users= {
    cnachen.enable = mkEnableOption "Whether to enable user: cnachen.";
  };

  imports = [
    ./cnachen.nix
  ];
}
