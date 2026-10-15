{
  flake.modules.nixos.nh = { config, ... }: {
    programs.nh = {
      enable = true;
      flake = "${config.users.users.dyna.home}/.dotfiles";
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 7d --keep 3";
      };
    };
  };
}
