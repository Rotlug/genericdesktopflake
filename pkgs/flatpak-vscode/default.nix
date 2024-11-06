{
  jq,
  lib,
  moreutils,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "flatpak-vscode";
    publisher = "bilelmoussaoui";
    version = "0.0.38";
    sha256 = "sha256-7ADrZzsYMGFkqfq92Vx5SGfEwyM4HNFEqZUJVeSrrU8=";
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
