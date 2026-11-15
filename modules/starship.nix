{
  flake.modules.homeManager.starship = {
    programs.starship = {
      enable = true;
      enableBashIntegration = true;
      presets = [ "catppuccin-powerline" ];
      settings.line_break.disabled = false;
      # Default NixOS symbol is "❄️" (U+2744 + VS16): kitty renders it 2 cells
      # wide but bash counts 1, which makes the cursor lag one column behind.
      settings.os.symbols.NixOS = " ";
    };
  };
}
