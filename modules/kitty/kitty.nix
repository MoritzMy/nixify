{
  flake.modules.homeManager.kitty = {
    programs.kitty = {
      enable = true;
      themeFile = "./Blazer";
      extraConfig = "background_opacity 0.85";
    };
  };
}
