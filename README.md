## About

This is my personal set of dotfiles I've put together after jumping the NixOS ship.

Currently **requires testing** on a fresh system.

Features:
- Half-assed Hyprland config involving lockscreen, wallpaper, runner
- Installer script to setup most of the system
- Packages added semi-declaratively via files with lists


## Requirements

There's some tools you need to have on your system in order to run the scripts:
- Git
- ...


## Installation

1. Clone repo:

```bash
git clone https://github.com/krasnykid/dotfiles
```

2. Run script:

```bash
chmod +x install.sh
./install.sh
```


## Why?

Because I hated how bulky NixOS is. Also, I had little disk space to spare and NixOS is not intended as disk-space-friendly environment. And I pretty much never ended up using my configs on more than one system at once.

What I liked about NixOS is how convenient it was to have one, centralized way of configuring the whole system and this I tried to replicate it on Arch with this repo and this is the main principle of the project.


## TODO

- Make **adding** and **removing** packages easier.
- Separate `install.sh` into chunks.
