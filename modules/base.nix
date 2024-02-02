{ config, lib, pkgs, ... }:

with lib; {
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 8;
      efi.canTouchEfiVariables = true;
    };
  };

  i18n.defaultLocale = "en_US.UTF-8";
  time.timeZone = "Asia/Shanghai";

  nix = {
    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];
      trusted-users = [ "root" "@wheel" ];
    };
  };

  environment.systemPackages = with pkgs; [
    tree
  ];

  services = {
    sshd.enable = true;
  };

  system.stateVersion = "23.11";
}
