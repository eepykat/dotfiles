{ pkgs, ... }: {
  programs.git = {
    enable = true;
    config = {
      user = {
        name = "eepykat";
        email = "eepykat@noreply.codeberg.org";
      };
      init.defaultBranch = "main";
    };
  };
}