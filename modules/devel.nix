{ config, lib, pkgs, ... }:

let
  cfg = config.cnachen.modules.devel;
in with lib; {
  config = mkIf cfg.enable {
    programs = {
      neovim = {
        enable = true;
        defaultEditor = true;
      };

      git = {
	enable = true;
      };
    };

    environment.systemPackages = with pkgs; [
      gcc gnumake
    ];
  };
}
