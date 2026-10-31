{
  flake.modules.nixos.nix = {
    programs.comma = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
