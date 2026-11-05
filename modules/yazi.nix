{
  flake.modules.homeManager.yazi = { pkgs, ... }: {
    programs.yazi = {
      enable = true;
      plugins = {
        inherit (pkgs.yaziPlugins) lazygit;
      };
    };
  };
}
