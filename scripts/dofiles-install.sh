#!/bin/sh

dotdir=$HOME/.dotfiles
repo=https://github.com/simoneruffini/dotfiles.git

git clone --bare $repo $dotdir
function dots{
	   /usr/bin/git --git-dir=$dotdir --work-tree=$HOME $@
   }
mkdir -p .dotfiles-backup
dots checkout
if [ $? = 0 ]; then
	echo "Checked out dots.";
else
	echo "Backing up pre-existing dot files.";
    	dots checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}
fi;
dots checkout
dots config status.showUntrackedFiles no
