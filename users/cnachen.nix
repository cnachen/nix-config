{ config, lib, pkgs, ... }:

let
  cfg = config.cnachen.users.cnachen;
in with lib; {
  config = mkIf cfg.enable {
    users.users.cnachen = {
      isNormalUser = true;
      extraGroups = [ "wheel" ];
      packages = with pkgs; [
        neofetch
	tealdeer
      ];
    };
  };
}
