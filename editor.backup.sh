#!/bin/bash

# atom
apm list --installed --bare > .atom/packages.list

# vscode
code --list-extensions > .vscode/extensions.list
