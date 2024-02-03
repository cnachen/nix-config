{ config, lib, pkgs, modulesPath, ... }:

let
  cfg = config.cnachen.hosts.nixvirt;
in with lib; {
  config = mkIf cfg.enable {
    boot.initrd.availableKernelModules = [ "ahci" "xhci_pci" "nvme" "usbhid" "sr_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ ];
    boot.extraModulePackages = [ ];

    fileSystems."/" =
      { device = "/dev/disk/by-uuid/8771fb0c-218b-47e3-ba79-f62ea2ace838";
        fsType = "ext4";
      };

    fileSystems."/boot" =
      { device = "/dev/disk/by-uuid/1C02-3A4E";
        fsType = "vfat";
      };

    networking.hostName = "nixvirt";
    networking.useDHCP = lib.mkDefault true;

    nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
  };
}
