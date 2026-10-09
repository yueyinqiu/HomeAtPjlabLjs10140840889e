{ lib, ... }: {
  programs.bash.enable = true;
  programs.bash.initExtra = lib.mkBefore ''
    . ~/.bashrc_proxy
  '';
}
