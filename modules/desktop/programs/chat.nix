{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        vesktop
        mumble
        # Matrix Clients
        cinny-desktop
        element-desktop
        inputs.sable.packages.${pkgs.stdenv.hostPlatform.system}.sable-desktop
    ];
    services.flatpak.packages = [

    ];
}
