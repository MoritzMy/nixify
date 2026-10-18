{
  flake.modules.homeManager.discord = { pkgs, ... }: {
    programs.discord.enable = true;
    home.packages = with pkgs; [
      catppuccin-discord
    ];
  };
}
