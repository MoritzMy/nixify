{
  flake.modules.nixos.hyprland = { pkgs, ... }: {
    programs.hyprland = {
      enable = true;
      withUWSM = true;
      portalPackage = pkgs.xdg-desktop-portal-hyprland;
    };
  };

  flake.modules.homeManager.hyprland = { pkgs, config, ... }: {
    wayland.windowManager.hyprland = {
      enable = true;
      # Use the system-level programs.hyprland packages (flake.modules.nixos.hyprland)
      # instead of a second home-manager-owned copy.
      package = null;
      portalPackage = null;
      configType = "lua";
    };

    # ~/.config/hypr is an out-of-store symlink to the dotfiles tree so the config
    # can be edited live without a rebuild. home-manager must therefore not try to
    # write its own generated config into that directory -- doing so fails with
    # "Error installing file '.config/hypr/...' outside $HOME".
    xdg.configFile."hypr/hyprland.conf".enable = false;
    xdg.configFile."hypr/hyprland.lua".enable = false;

    xdg.configFile."hypr".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/.dotfiles/modules/hyprland/hypr";

    home.packages = [ pkgs.kitty ];
  };
}
