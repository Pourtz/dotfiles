# PACKAGES

* Xorg
  ```sh
  sudo pacman -S xorg xf86-video-intel mesa alsa-utils alsa-plugins lightdm lightdm-gtk-greeter
  ```
* Desktop
  * Common packages
    ```sh
    sudo pacman -S dunst rofi picom xss-lock network-manager-applet
    paru -S i3lock-color
    ```
  * `leftwm`
    ```sh
    paru -S leftwm leftwm-theme-git polybar feh
    ```
  * `i3`
    ```sh
    sudo pacman -S i3 polybar nitrogen
    ```
  * `xmonad`
    ```sh
    sudo pacman -S xmonad xmonad-contrib xmobar nitrogen
    paru -S trayer-srg
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

## [Paru](https://github.com/Morganamilo/paru#readme)

```sh
sudo pacman -S --needed base-devel; git clone https://aur.archlinux.org/paru.git; cd paru; makepkg -si
```

- Enable `color` in /etc/pacman.conf
- Enable `BottomUp` in /etc/paru.conf

## AUR

```sh
paru -S pulseaudio-ctl rate-mirrors escrotum-git
```
