{ config, pkgs, ... }:
{
  imports =
    [
      ./hyprland.nix
      ./displayManager.nix
      ./browser.nix
    ];
}
