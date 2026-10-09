{
  name,
  pkgs,
  nix-airgap,
  ...
}:

let
  installable = ".#homeConfigurations.\"lujiaqi.p@ljs-10-140-84-0-889e\".activationPackage";
  remoteHost = "pjlab";
  remoteOutLink = "/home/lujiaqi.p/.cache/home-manager-remote-switch/result";
in
pkgs.writeShellApplication {
  name = name;
  text = ''
    ${pkgs.lib.escapeShellArgs [
      "${nix-airgap.airgap}/bin/nix-airgap"
      installable
      remoteHost
      "--remote-out-link"
      remoteOutLink
    ]}

    ${pkgs.lib.escapeShellArgs [
      "ssh"
      remoteHost
      "--"
      "${remoteOutLink}/activate"
    ]}
  '';
}
