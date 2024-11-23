{
  jq,
  lib,
  moreutils,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "pyright";
    publisher = "ms-pyright";
    version = "1.1.388";
    sha256 = "sha256-pV26ouD4hL9mAtGq0FBhUjvNoPSZJfg62GnhW57ToV4=";
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
