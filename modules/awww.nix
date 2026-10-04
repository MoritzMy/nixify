{
  flake.modules.homeManager.awww = { inputs, pkgs, ... }: {
    services.awww.enable = true;
  };
}
