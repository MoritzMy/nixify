{
  flake.modules.homeManager.discord = { pkgs, ... }:
    let
      catppuccin-discord = pkgs.catppuccin-discord.override {
        flavour = [ "mocha" ];
        accents = [ "blue" ];
      };
      # themes only accepts a top-level store path, not a sub-path string
      catppuccin = pkgs.runCommand "catppuccin.theme.css" { } ''
        cp ${catppuccin-discord}/share/catppuccin-mocha-blue.theme.css $out
      '';
    in
    {
      programs.vesktop = {
        enable = true;
        vencord = {
          themes.catppuccin = catppuccin;
          settings.enabledThemes = [ "catppuccin.css" ];
        };
      };
    };
}
