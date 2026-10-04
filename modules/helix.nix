{
  flake.modules.homeManager.helix = { pkgs, ... }: {
    programs.helix = {
      enable = true;
      defaultEditor = true;
      extraPackages = with pkgs; [
        nixd
        nixfmt
      ];

      settings = {
        theme = "catppuccin_mocha";
        editor.line-number = "relative";
      };

      languages = {
        language-server.nixd = {
          command = "nixd";
          # Lets nixd complete and check NixOS/home-manager option names
          # against this flake's actual configuration.
          config.nixd =
            let
              flake = ''(builtins.getFlake "/home/dyna/.dotfiles")'';
            in
            {
              nixpkgs.expr = "import ${flake}.inputs.nixpkgs { }";
              formatting.command = [ "nixfmt" ];
              options = {
                nixos.expr = "${flake}.nixosConfigurations.nox.options";
                home-manager.expr = "${flake}.nixosConfigurations.nox.options.home-manager.users.type.getSubOptions [ ]";
              };
            };
        };

        language = [
          {
            name = "nix";
            language-servers = [ "nixd" ];
            formatter.command = "nixfmt";
            auto-format = true;
          }
        ];
      };
    };
  };
}
