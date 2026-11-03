# ./modules/desktop/desktop-environment/greetd.nix
{ pkgs, ... }: {
  security.polkit.enable = true;
  services.accounts-daemon.enable = true;
  services.displayManager.noctalia-greeter = {
    enable = true;
    passwordless-sync-users = [ "kat5" ];

    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
    };

    settings = {
      cursor.size = 24;
      keyboard.layout = "us";
    };
  };
}