{
  flake.modules.homeManager.starship = {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      presets = [ "catppuccin-powerline" ];
    };
  };
}
