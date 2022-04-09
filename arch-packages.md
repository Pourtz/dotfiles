# PACKAGES

vim
xorg xf86-video-intel mesa lightdm lightdm-gtk-greeter
spectrwm kitty
firefox zathura zathura-pdf-mupdf
fish
texlive-most

## SOURCE

https://github.com/Jguer/yay#readme

pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si

https://github.com/hlissner/doom-emacs/blob/master/docs/getting_started.org#doom-emacs

pacman -S --needed git emacs ripgrep fd
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

## AUR

visual-studio-code-bin
tllocalmgr-git
