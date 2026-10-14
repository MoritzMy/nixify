{
  flake.modules.nixos.vpn = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gpclient
      gpauth
    ];
  };
}
