{
  flake.modules.homeManager.devenv = {
    programs.devenv = {
      enable = true;
      enableBashIntegration = true;
    };
  };
}
