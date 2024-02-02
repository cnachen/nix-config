deploy:
	nixos-rebuild switch --flake .#nixvirt

debug:
	nixos-rebuild switch --flake .#nixvirt --show-trace --verbose

up:
	nix flake update

history:
	nix profile history --profile /nix/var/nix/profiles/system

repl:
	nix repl -f flake:nixpkgs

clean:
	nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

gc:
	nix store gc --debug
	nix-collect-garbage --delete-old
