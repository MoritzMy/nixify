{
  flake.modules.nixos.nix = {
    programs.nix-index = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
