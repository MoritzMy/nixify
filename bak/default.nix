{ config, pkgs, ... }:
{
    imports = [
	./nixos/modules/desktop.nix
	./nixos/modules/browser.nix
	./nixos/modules/displayManager.nix
	./nixos/modules/hyprland.nix
	./nixos/modules/gaming.nix	
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    environment.variables.EDITOR = "nano";

    environment.systemPackages = with pkgs; [
	git
	nano
	vim
	wget
	curl
	neovim
	unrar
	home-manager
    ];

    nixpkgs.config.allowUnfree = true;
}
