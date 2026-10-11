{
  flake.modules.nixos.wine = {
    hardware.graphics.enable32Bit = true;
  };

  flake.modules.homeManager.wine = { pkgs, ... }: {
    home.packages = [
      pkgs.wineWow64Packages.stable
      pkgs.winetricks
    ];
  };
}
