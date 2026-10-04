{ pkgs, ... }:
{ 
  programs.bash = {
    enable = true;
    enableCompletion = true;
    historyControl = [ ignoredups ];
    shellAliases = {
      ll = "ls -la"
    }
  };
};
