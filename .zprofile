#!/bin/zsh

## zsh profile file. Runs on login. Environmental variables are set here.

## If you don't plan on reverting to bash, you can remove the link in ~/.profile
## to clean up.

## Adds `~/.local/bin` to $PATH
export PATH="$PATH:$(du "$HOME/.local/bin/" | cut -f2 | paste -sd ':')"

## Default programs:
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="firefox"
export READER="zathura"

## ~/ Clean-up:
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
export GTK2_RC_FILES="${XDG_CONFIG_HOME:-$HOME/.config}/gtk-2.0/gtkrc-2.0"
export WGETRC="${XDG_CONFIG_HOME:-$HOME/.config}/wget/wgetrc"
export ZDOTDIR="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
export ANDROID_PREFS_ROOT="$XDG_CONFIG_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/emulator
export CARGO_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/cargo"
export RUSTUP_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/rustup"

export GOPATH="${XDG_DATA_HOME:-$HOME/.local/share}/go"                 ## all librearies installed with go get will be saved here
export PATH="$PATH:$GOPATH/bin"                                         ## this will be applied to the path before, so order is important
export GOPATH="$GOPATH:$HOME/Documents/go"                              ## all additional code that will be written here will be visible by go

export HISTFILE="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/history"
export PASSWORD_STORE_DIR="${XDG_DATA_HOME:-$HOME/.local/share}/pass"
export GRIPHOME="${XDG_CACHE_HOME:-$HOME/.cache}/grip"
export _JAVA_OPTIONS=-Djava.util.prefs.userRoot="${XDG_CONFIG_HOME:-$HOME/.config}"/java
export TASKRC="${XDG_CONFIG_HOME:-$HOME/.config}/task/"
export TASKDATA="${XDG_DATA_HOME:-$HOME/.local/share}/task"

# Other program settings
export QT_QPA_PLATFORMTHEME="gtk2"	# Have QT use gtk2 theme.
export FZF_DEFAULT_OPTS="--layout=reverse --height 40% "
export MOZ_USE_XINPUT2="1"		# Mozilla smooth scrolling/touchpads.
export LESS=-R				# Color sequences are printed raw
export LESSHISTFILE="-"
export _JAVA_AWT_WM_NONREPARENTING=1	# Used by wayland for scaling properly java apps

export LF_ICONS="di= :\
fi= :\
tw=🤝 :\
ow= :\
ln= :\
or= :\
ex= :\
*.txt= :\
*.mom= :\
*.me= :\
*.ms= :\
*.png= :\
*.webp= :\
*.ico= :\
*.jpg= :\
*.jpe= :\
*.jpeg= :\
*.gif= :\
*.svg= :\
*.tif= :\
*.tiff= :\
*.xcf= :\
*.html= :\
*.xml= :\
*.gpg= :\
*.css= :\
*.pdf= :\
*.djvu=📚 :\
*.epub=📚 :\
*.csv= :\
*.xlsx= :\
*.rmd=📊 :\
*.Rmd=📊 :\
*.m=📊 :\
*.mp3=🎵 :\
*.opus=🎵 :\
*.ogg=🎵 :\
*.m4a= :\
*.flac= :\
*.mkv= :\
*.mp4= :\
*.webm= :\
*.mpeg= :\
*.avi= :\
*.7z= :\
*.ace= :\
*.alz= :\
*.arc= :\
*.arj= :\
*.bz= :\
*.bz2= :\
*.cab= :\
*.cpio= :\
*.deb= :\
*.dwm=:\
*.dz= :\
*.ear= :\
*.esd= :\
*.gz= :\
*.jar= :\
*.lha= :\
*.lrz= :\
*.lz= :\
*.lz4= :\
*.lzh= :\
*.lzma= :\
*.lzo= :\
*.rar= :\
*.rpm= :\
*.rz= :\
*.sar= :\
*.swm= :\
*.t7z= :\
*.tar= :\
*.taz= :\
*.tbz= :\
*.tbz2= :\
*.tgz= :\
*.tlz= :\
*.txz= :\
*.tz= :\
*.tzo= :\
*.tzst= :\
*.war= :\
*.wim= :\
*.xz= :\
*.z= :\
*.zip= :\
*.zoo= :\
*.zst= :\
*.z64= :\
*.v64= :\
*.n64= :\
*.gba= :\
*.nes= :\
*.gdi= :\
*.1= :\
*.nfo= :\
*.info= :\
*.log= :\
*.iso= :\
*.img= :\
*.bib= :\
*.ged=👪 :\
*.part= :\
*.torrent= :\
*.conf= :\
*.db= :\
*.tex= :\
*.md= :\
*.c= :\
*.cc= :\
*.clj= :\
*.coffee= :\
*.cpp= :\
*.css= :\
*.d= :\
*.dart= :\
*.erl= :\
*.exs= :\
*.fs= :\
*.go= :\
*.h= :\
*.hh= :\
*.hpp= :\
*.hs= :\
*.html= :\
*.jar= :\
*.java= :\
*.jl= :\
*.js= :\
*.json= :\
*.lua= :\
*.nix= :\
*.php= :\
*.pl= :\
*.pro= :\
*.py= :\
*.rb= :\
*.rs= :\
*.scala= :\
*.ts= :\
*.r=📊 :\
*.R=📊 :\
*.vim= :\
"
#
