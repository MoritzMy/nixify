{
  flake.modules.homeManager.bash = {
    programs.bash = {
      enable = true;
      enableCompletion = true;
      historyControl = [ "ignoredups" ];
      shellAliases = {
        ll = "ls -la";
        rebuild = "sudo nixos-rebuild switch --flake /home/dyna/.dotfiles/";
      };
    };
  };
}
