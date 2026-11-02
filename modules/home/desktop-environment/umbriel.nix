# modules/home/desktop-environment/umbriel.nix
{ config, inputs, lib, pkgs, ... }: {
  imports = [ 
    inputs.umbriel.homeModules.default 
  ];

  programs.umbriel = {
    enable = true;
    settings = {
      general = {
        autostart = [ "noctalia" ];
      };
    };
  };
}