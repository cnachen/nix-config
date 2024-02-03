{
  description = "Cnachen's NixOS Flake.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  };

  outputs = flakes @ { self, nixpkgs, ... }: {
    nixosConfigurations = {
      nixvirt = nixpkgs.lib.nixosSystem {
	system = "aarch64-linux";
	specialArgs = flakes;
	modules = [
	  ./config.nix
	];
      };
    };
  };
}
