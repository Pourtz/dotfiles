# Installation instructions
## Pre-installation
1. Build and image in this folder:
```bash
nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix
```
2. Write the ISO to a USB stick:
```bash
sudo dd if=./result/iso/nixos-20.03....-x86_64-linux.iso of=/dev/<usb device> bs=1M status=progress
```
3. Boot into the live USB.

## Installation
### Partitions and subvolumes
1. Partition the disk according to the following scheme:

| Partition | Size |
|-----------|------|
| EFI       | 512M |
| Swap      | 8G   |
| Root      | Rest |

2. Use dm-crypt to encrypt the root partition, which would be available at `/dev/mapper/enc` after running this commands
```bash
cryptsetup --verify-passphrase -v luksFormat "$ROOT-PARTITION"
cryptsetup open "$ROOT-PARTITION" enc
```
3. Format each partition as needed:
```bash
mkfs.vfat -n boot "$EFI-PARTITION"
mkswap "$SWAP-PARTITION"
swapon "$SWAP-PARTITION"
mkfs.btrfs /dev/mapper/enc
```
4. Make btrfs subvolumes:
  - Mount the volume
  ```bash
  mount -t btrfs /dev/mapper/enc /mnt
  ```
  - Create subvolumes
  ```bash
  btrfs subvolume create /mnt/root
  btrfs subvolume create /mnt/home
  btrfs subvolume create /mnt/nix
  ```
  - Take an empty readonly snapshot of the root subvolume
  ```bash
  btrfs subvolume snapshot -r /mnt/root /mnt/root-blank
  ```
  - Unmount the volume
  ```bash
  umount /mnt
  ```
5. Mount everything
```bash
mount -o subvol=root,compress=zstd,noatime /dev/mapper/enc /mnt

mkdir /mnt/home
mount -o subvol=home,compress=zstd,noatime /dev/mapper/enc /mnt/home

mkdir /mnt/nix
mount -o subvol=nix,compress=zstd,noatime /dev/mapper/enc /mnt/nix

mkdir /mnt/boot
mount "$EFI-PARTITION" /mnt/boot
```

### Building the system
1. Clone this repository
```bash
git clone https://github.com/Pourtz/dotfiles.git
```
2. Generate the config
```bash
cd dotfiles/system/
nixos-generate-config --root /mnt
mv /mnt/etc/nixos/configuration.nix .
mv -T /mnt/etc/nixos/hardware-configuration.nix ./<system>-hardware.nix
```
3. Build the system
```bash
cd ..
nixos-install --show-trace --root /mnt --flake .#<system>
```

## Post-install
1. Change user passwords. They are set to `nixos` by default.
```bash
passwd
sudo passwd $USER
```
