{
  flake.modules.homeManager.jetbrains = { pkgs, ... }: {
    home.packages = with pkgs; [
      goland
      intellij-idea
    ];
  };
}
