# PACKAGES

* Xorg
  ```sh
  sudo pacman -S xorg xf86-video-intel mesa alsa-utils alsa-plugins lightdm lightdm-gtk-greeter
  ```
* Desktop
  * Common packages
    ```sh
    sudo pacman -S dunst nitrogen rofi picom xss-lock
    yay -S i3lock-color
    ```
  * `i3`
    ```sh
    sudo pacman -S i3 polybar
    ```
  * `xmonad`
    ```sh
    sudo pacman -S xmonad xmonad-contrib xmobar
    yay -S trayer-srg
    ```
* Shell
  * `fish`
  ```sh
  sudo pacman -S fish
  ```
    * [oh-my-fish](https://github.com/oh-my-fish/oh-my-fish#installation)
    ```sh
    curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
    ```
* Programs
  ```sh
  sudo pacman -S kitty firefox zathura zathura-pdf-mupdf texlive-most
  ```
* Optional programs
  * `broot`
  * `shtop`
  * `conky`
  * `discord`

## [Doom Emacs](https://github.com/hlissner/doom-emacs/blob/master/docs/getting_started.org#doom-emacs)

```sh
sudo pacman -S --needed git emacs-nativecomp ripgrep fd
git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install
```

Add to `.bashrc`/`.zshrc`
```sh
export PATH="$HOME/.emacs.d/bin:$PATH"
```

## [Yay](https://github.com/Jguer/yay#readme)

```sh
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

## AUR

```sh
yay -S pulseaudio-ctl rate-mirrors escrotum-git
```
