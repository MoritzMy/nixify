{
  flake.modules.nixos.brightness = { pkgs, ... }: {
    environment.systemPackages = [
      pkgs.brightnessctl
    ];
  };
}
