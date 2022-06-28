# Remove greeting
#set -U fish_greeting
function fish_greeting
  fortune -s | cowthink | lolcat
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end

alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
alias ua-update-all='export TMPFILE="$(mktemp)"; \
    sudo true; \
    rate-mirrors --save=$TMPFILE arch --max-delay=21600 \
      && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
      && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
      && ua-drop-caches \
      && yay -Syyu'

fish_add_path ~/.emacs.d/bin
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
