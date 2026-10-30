{
  flake.modules.homeManager.noctalia = {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
    };

    xdg.configFile."cava/config".text = ''
      [color]
      theme = "noctalia"
    '';
  };
}
