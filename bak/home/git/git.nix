{ pkgs, ... }:
{
  programs.git = {
    enable = true;
    includes = [
      { path = "./credentials"; }
    ];
    settings = {
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };
}
