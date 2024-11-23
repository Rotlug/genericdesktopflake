{
  jq,
  lib,
  moreutils,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "blueprint-gtk";
    publisher = "bodil";
    version = "0.2.0";
    sha256 = "sha256-A4H/o/HsjQKKee46VZJsjY7EB+1iOm4RWxHKcRLmkEY=";
  };
  nativeBuildInputs = [
    jq
    moreutils
  ];
#   postInstall = ''
#     cd "$out/$installPrefix"
#     jq '.contributes.configuration.properties."shellcheck.executablePath".default = "${shellcheck}/bin/shellcheck"' package.json | sponge package.json
#   '';
  meta = {
    description = "Flatpak Integration for VSCode";
    downloadPage = "https://marketplace.visualstudio.com/items?itemName=bilelmoussaoui.flatpak-vscode";
    homepage = "https://github.com/bilelmoussaoui/flatpak-vscode";
    license = lib.licenses.mit;
    maintainers = [];
  };
}
