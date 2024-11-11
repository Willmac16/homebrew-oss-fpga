# Homebrew Repository for Open-Source FPGA Tools

In recent years, there's been an amazing reniassance of open-source FPGA tools -- including tools that allow creation of
usable FPGA bitstreams using entirely open-source tools. This is amazing -- especially as it allows us to avoid running
clunky vendor GUIs on the few Windows / Linux distributions they support.

This repostiory allows you to easily install some of those open-source toolchains.

### GUI Support
simply add `--with-qt@5` when installing any of the recipes to add support for the nextpnr gui

## Getting Started -- ice40

```bash
brew tap willmac16/oss-fpga
brew install --HEAD nextpnr-ice40
```

## Getting Started -- ecp5

```bash
brew tap willmac16/oss-fpga
brew install --HEAD nextpnr-ecp5
```

## Installing all `nextpnr` variants
```bash
brew tap willmac16/oss-fpga
brew install --head nextpnr-ice40 nextpnr-ecp5 nextpnr-generic
```
