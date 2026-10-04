{ config, pkgs, ... }:
{
    imports = [
	./gaming/steam.nix
	./gaming/game_setup.nix
	./gaming/wine.nix
    ];
}
