{
  flake.modules.homeManager.neovim = { config, pkgs, ... }: {
    programs.neovim = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        nixd
        lua-language-server
        gopls
        ripgrep
        fd
      ];
    };

    xdg.configFile."nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/neovim/nvim";
  };
}
