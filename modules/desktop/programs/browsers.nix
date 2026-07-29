{ config, lib, pkgs, modulesPath, inputs, ... }:
{
    environment.systemPackages = with pkgs; [
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ungoogled-chromium
        
    ];
}
