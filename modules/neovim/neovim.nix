{
  flake.modules.homeManager.neovim = { config, pkgs, ... }: {
    home.packages = with pkgs; [
      neovim
      nixd
      lua-language-server
      gopls
      ripgrep
      fd
    ];

    home.sessionVariables.EDITOR = "nvim";

    xdg.configFile."nvim".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/.dotfiles/modules/neovim/nvim";
  };
}
