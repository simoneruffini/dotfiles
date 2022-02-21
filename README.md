# DOTFILES
These dotfiles are managed via [chezmoi](https://github.com/twpayne/chezmoi/)

Currently they refer to a `sway` + `zsh` configuration on a DELL XPS 15, but not tightly specific to it.

# Setup
## Install Chezmoi
```sh
# Linux
sh -c "$(wget -qO- chezmoi.io/get)"
# Windows/Powershell
(iwr -UseBasicParsing https://chezmoi.io/get.ps1).Content | powershell -c -
```
For other install methods check [this link](https://www.chezmoi.io/install/)
## Download Dotfiles
Download repository locally
```sh
chezmoi init https://github.com/simoneruffini/dotfiles.git
```
## Configure Chezmoi
Create the configuration file for chezmoi:
```sh
mkdir ~/.config/chezmoi/
touch ~/.config/chezmoi/chezmoi.toml
```
And add the mail option in the toml config:
```toml
[data]
   email="your.email@domain.com"
```
This will be used as a template for git and other configurations.
### Platform Specific Notes
If you are using wsl add the `win_home` parameter to set the path to your windows
home from wsl
```toml
[data]
   win_home="/mnt/c/Users/<windows_username>/"
```

## Install Targets
Get which cahnges will be done by chezmoi with either `chezmoi status` or `chezmoi diff`.

If you want to install all dotfiles simply type `chezmoi apply -v` otherwise
select which configurations are necessary and add them one by one with
```sh
chezmoi apply <dotfile path from chezmoi status>
```
