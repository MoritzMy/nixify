{
  flake.modules.homeManager.quickshell = {
    programs.quickshell = {
      enable = true;
      systemd.enable = true;
    };
  };
}
