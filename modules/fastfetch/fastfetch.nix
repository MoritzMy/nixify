{
  flake.modules.homeManager.fastfetch = {
    programs.fastfetch = {
      enable = true;
      settings = {
        logo = {
          type = "kitty";
          source = "${./nixos-portal.png}";
          width = 32;
          padding = {
            right = 3;
          };
        };
        # without an explicit list, a config file means zero modules
        modules = [
          "title"
          "separator"
          "os"
          "host"
          "kernel"
          "uptime"
          "packages"
          "shell"
          "display"
          "de"
          "wm"
          "wmtheme"
          "theme"
          "icons"
          "font"
          "cursor"
          "terminal"
          "terminalfont"
          "cpu"
          "gpu"
          "memory"
          "swap"
          "disk"
          "localip"
          "battery"
          "poweradapter"
          "locale"
          "break"
          "colors"
        ];
      };
    };
  };
}
