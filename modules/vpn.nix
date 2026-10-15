{
  flake.modules.nixos.vpn = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      gpclient
      gpauth
    ];

    networking.networkmanager.dispatcherScripts = [
      {
        source = "${pkgs.gpclient}/lib/NetworkManager/dispatcher.d/pre-down.d/gpclient.down";
        type = "pre-down";
      }
    ];
  };
}
