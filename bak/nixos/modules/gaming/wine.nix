{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wineWow64Packages.waylandFull   # or wineWow64Packages.waylandFull
    winetricks
  ];

  # 32-bit graphics libs — needed for most older Windows apps
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };
}
