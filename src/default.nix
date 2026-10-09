{ ... }: {
  home.username = "yueyinqiu";
  home.homeDirectory = "/home/lujiaqi.p";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "26.05";
}
