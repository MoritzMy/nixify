{
  flake.modules.homeManager.noctalia = {
    programs.noctalia = {
      enable = true;
      systemd.enable = true;
      settings = {
        theme.templates = {
          enable_builtin_templates = true;
          builtin_ids = [
            "hyprland"
            "helix"
            "kitty"
          ];
          enable_community_templates = true;
          community_ids = [
            "claude-code"
            "zen-browser"
            "discord"
            "obsidian"
            "steam"
            "yazi"
          ];
        };
      };

    };

    xdg.configFile."cava/config".text = ''
      [color]
      theme = "noctalia"
    '';
  };
}
