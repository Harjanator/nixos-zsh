[![NixOS 26.05+](https://img.shields.io/badge/NixOS-26.05%2B-a6e3a1?labelColor=45475a)](https://nixos.org/)
[![License MIT](https://img.shields.io/badge/License-MIT-cba6f7.svg?labelColor=45475a)](LICENSE.md)
[![Portal](https://img.shields.io/badge/Portal-typovrak.tv%2Fnixos-eba0ac?labelColor=45475a)](https://typovrak.tv/nixos)
[![Discord join us](https://img.shields.io/badge/Discord-Join%20us-74c7ec?labelColor=45475a&logo=discord&logoColor=white)](https://typovrak.tv/discord)

<div>
  <a href="https://visitorbadge.io/status?path=https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos-zsh"><img src="https://api.visitorbadge.io/api/visitors?path=https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos-zsh&label=GET%20https%3A%2F%2Fgithub.com%2Ftypovrak%2Fnixos-zsh&labelColor=%23a6e3a1&countColor=%231e1e2e" /></a>
</div>

# 🔧 NixOS Zsh

> Simple NixOS module to bootstrap and manage a full-featured Zsh environment with config, history, plugins, prompt, SSH agent, aliases and more.

## 🧩 Part of the Typovrak NixOS ecosystem

This module is part of ```Typovrak NixOS```, a fully modular and declarative operating system configuration built entirely with :

- 🧱 **30+ standalone modules :** Each managing a specific tool, feature or aesthetic like ```zsh```, ```i3```, ```lighdm```, ```polybar```, ```gtk``` and more.
- 🎨 **Catppuccin Mocha :** The default theme across terminal, GUI, and login interfaces.
- 🛡️ **100% FOSS compliant :** No proprietary software included unless explicitly chosen.
- 🧑‍💻 **Built for developers :** Optimized for speed, keyboard-centric workflows and expressive CLI tooling.

*Explore the full system : 👉 [github.com/typovrak/nixos](https://github.com/typovrak/nixos)*

> [!CAUTION]
> This module is opinionated, it may **override**, **replace**, or **remove** files and settings **without** prompt. To avoid unexpected changes, **back up** your existing files or **fork** this module to take full control. **Follow this documentation** to avoid any of this problem.

## 📦 Features

- 🔒 **Secure dotfiles :** Installs ```.zshrc``` and initializes ```.zsh_history``` with `600` permissions and correct ownership.
- 🐚 **Default shell :** Sets zsh as the login shell for the configured user.
- ⚙️ **Essential plugins :** Installs and sources ```zsh-autosuggestions``` and ```zsh-syntax-highlighting```.
- ⭐ **Starship prompt :** Initializes [Starship](https://starship.rs/) for a modern and fast prompt without configuration.
- 🔑 **SSH agent :** Auto-starts ```ssh-agent``` and loads your SSH keys on login.
- ✏️ **Editor & aliases :** Sets ```EDITOR=nvim```, aliases ```v```, ```vi```, ```vim``` to Neovim and ```ls``` to ```eza```.
- 🚀 **Fastfetch :** Displays system info on shell startup.
- 📦 **Package management :** Ensures all required packages are in ```environment.systemPackages``` like ```zsh```, ```vim```, ```neovim```, ```eza``` and more.

## 📂 Repository structure

```bash
❯ tree -a -I ".git*"
.
├── configuration.nix # module configuration
├── LICENSE.md        # MIT license
├── README.md         # this documentation
└── .zshrc            # zsh configuration

1 directory, 4 files
```

## ⚙️ Prerequisites

### 1. NixOS version
Requires NixOS 24.11 or newer.

### 2. User validation
the target user must be defined in ```config.username```. See [typovrak main nixos configuration](https://github.com/typovrak/nixos) for more details.

### 3. Backup
Before proceeding, back up existing configuration if needed
```bash
cp ~/.zshrc{,.bak}
```

## ⬇️ Installation

### 🚀 Method 1 : Out-of-the-box

Fetch the module directly in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
# /etc/nixos/configuration.nix

let
  nixos-zsh = fetchGit {
    url = "https://github.com/typovrak/nixos-zsh.git";
    ref = "main";
    rev = "55181d862b8459851d8ec6b97fd48f2a8298bd4d"; # update to the desired commit
  };
in
{
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-zsh}/configuration.nix")
  ];
}
```

Once imported, rebuild your system to apply changes
```bash
sudo nixos-rebuild switch
```

### 🍴 Method 2 : Fork

Want to **personalize** this module ?

Fork it and add this custom module in your [main nixos configuration](https://github.com/typovrak/nixos) at ```/etc/nixos/configuration.nix``` using fetchGit
```nix
let
  nixos-zsh = fetchGit {
    url = "https://github.com/<YOUR_USERNAME>/nixos-zsh.git";
    ref = "main";
    rev = "<COMMIT>"; # see below
  };
in {
  imports = [
    /etc/nixos/hardware-configuration.nix # system hardware settings
    /etc/nixos/variables.nix # defines config.username and other variables, see https://github.com/typovrak/nixos for more details
    (import "${nixos-zsh}/configuration.nix")
  ];
}
```

Get the latest commit hash by executing
```bash
git clone https://github.com/<YOUR_USERNAME>/nixos-zsh.git &&
cd nixos-zsh &&
git log -1 --pretty=format:"%H"
```

## 🎬 Usage

Open a new terminal or reboot your system to see your new terminal setup.

## 📚 Learn more

- 🧠 [Zsh GitHub repository](https://github.com/zsh-users/zsh) : Official source for the Zsh shell.
- ✨ [Starship prompt](https://starship.rs/) : A fast, customizable, and minimal prompt for any shell.
- 🧩 [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions) : Fish-like autosuggestions for Zsh.
- 🎨 [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting) : Syntax highlighting for the command line.

## 🌐 Discover my NixOS system portal

Dive into [typovrak.tv/nixos](https://typovrak.tv/nixos) Catppuccin mocha green themed **gateway** to my GitHub and NixOS setup.

Browse **every module**, example and config in a sleek with an interactive interface that feels just like your desktop.

## ❤️ Support

If this module saved you time, please ⭐️ the repo and share feedback.

## 💬 Join the Typovrak community on Discord 🇫🇷

If you've ever ```rm -rf```ed your config by mistake or rebuilt for the 42nd time because a semicolon was missing…

You're not alone, **Welcome home !**

🎯 [Join us on Discord »](https://typovrak.tv/discord)

🧭 What you’ll find is :

- ```💻 #nixos-setup``` - get help with modules, rebuilds and configs.
- ```🌐 #web-dev``` - talk JS, TypeScript, React, Node and more.
- ```🧠 #open-source``` - share your repos, contribute to others and discuss FOSS culture.
- ```⌨️ #typing``` - layouts, mechanical keyboards and speed goals.
- ```🎨 #ricing``` - dotfiles, theming tips and desktop screenshots.

*Everyone's welcome no matter how many times you've broken your system ~~(except for Windows users)~~ 😄*

---

<p align="center"><i>Made with 💜 by <a href="https://typovrak.tv">typovrak</a></i></p>
