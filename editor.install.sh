!/bin/bash

# atom
apm install --packages-file .atom/packages.list

# vscode
cat .vscode/extensions.list | xargs -L1 code --install-extension
