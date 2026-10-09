{ ... }: {
  programs.bash.enable = true;
  programs.bash.bashrcExtra = ''
    . ~/.bashrc_proxy
  '';
}
