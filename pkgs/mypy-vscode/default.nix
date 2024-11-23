{
  jq,
  lib,
  moreutils,
  vscode-utils,
}:

vscode-utils.buildVscodeMarketplaceExtension {
  mktplcRef = {
    name = "mypy-type-checker";
    publisher = "ms-python";
    version = "2024.1.12601012";
    sha256 = "sha256-shOk51jru2xHq+LU3AoMRV4Rp5+nnlYear70FI+8mRQ=";
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
