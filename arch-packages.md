# PACKAGES

* Xorg
  ```bash
  sudo pacman -S xorg xf86-video-intel mesa alsa-utils alsa-plugins lightdm lightdm-gtk-greeter
  ```
* Window manager
  ```bash
  sudo pacman -S i3 picom kitty fish polybar
  ```
* Programs
  ```bash
  sudo pacman -S firefox zathura zathura-pdf-mupdf texlive-most
  ```

## [Doom Emacs](https://github.com/hlissner/doom-emacs/blob/master/docs/getting_started.org#doom-emacs)

```bash
sudo pacman -S --needed git emacs-nativecomp ripgrep fd
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

## [Yay](https://github.com/Jguer/yay#readme)

```bash
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

## AUR

```bash
yay -S pulseaudio-ctl
```
