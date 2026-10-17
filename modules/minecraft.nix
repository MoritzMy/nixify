{
  flake.modules.homeManager.minecraft = { pkgs, ... }: {
    home.packages = with pkgs; [
      modrinth-app
    ];
  };
}
