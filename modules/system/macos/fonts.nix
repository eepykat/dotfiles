# /modules/mac/system/fonts.nix
{ inputs, pkgs, ... }: {
    fonts.packages = [
    pkgs.nerd-fonts.jetbrains-mono
    ];
}