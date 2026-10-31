{ config, pkgs, ... }:

let 
	username = config.username;
	group = config.users.users.${username}.group or "users";
	home = config.users.users.${username}.home;
in {
	system.activationScripts.zsh = ''

		mkdir -p ${home}/.config/ohmyposh
		chown ${username}:${group} ${home}/.config/ohmyposh
		chmod 700 ${home}/.config/ohmyposh

		cp ${./zen.toml} ${home}/.config/ohmyposh/zen.toml
		chown ${username}:${group} ${home}/.config/ohmyposh/zen.toml
		chmod 600 ${home}/.config/ohmyposh/zen.toml
		
		cp ${./.zshrc} ${home}/.zshrc
		chown ${username}:${group} ${home}/.zshrc
		chmod 600 ${home}/.zshrc

		touch ${home}/.zsh_history
		chown ${username}:${group} ${home}/.zsh_history
		chmod 600 ${home}/.zsh_history
	'';

	users.users.${username} = {
		shell = pkgs.zsh;
#		packages = with pkgs; [
#			oh-my-posh
#			zinit 
#			zoxide 
#			zsh-fzf-tab 
#			nix-zsh-completions
#    	];
	};

	environment.systemPackages = with pkgs; [
		zsh
		zsh-autosuggestions
		zsh-syntax-highlighting
		oh-my-posh
		zinit 
		zoxide 
		zsh-fzf-tab 
        nix-zsh-completions

#		starship
#		openssh
#		vim
#		neovim
		eza
#		fastfetch
#		pnpm
	];

#	services.openssh.enable = true;

#    programs.oh-my-posh = {
#      enable = true;
#      enableZshIntegration = true;
#,      configFile = "${home}/.config/ohmyposh/zen.toml";
#    };

#    programs.zoxide = {
#      enable = true;
#      enableZshIntegration = true;
#      options = [
#        "--cmd cd" 
#      ];
#    };

	programs.zsh = {
		enable = true;
#		enableCompletion = true;
		promptInit = ''
#			autoload -Uz compinit
#			compinit

			source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
			source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
			source ${pkgs.zinit}/share/zinit/zinit.zsh
#			eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${home}/.config/ohmyposh/paradox.omp.json)"
#			eval "$(${pkgs.starship}/bin/starship init zsh)"

#			if [ -z "$SSH_AUTH_SOCK" ]; then
#				eval "$(${pkgs.openssh}/bin/ssh-agent -s)" &>/dev/null
#			fi

#			${pkgs.openssh}/bin/ssh-add ~/.ssh/typovrak_github &>/dev/null
#			${pkgs.openssh}/bin/ssh-add ~/.ssh/mscholz_dev_gitlab &>/dev/null
#			${pkgs.openssh}/bin/ssh-add ~/.ssh/revres &>/dev/null
#			${pkgs.openssh}/bin/ssh-add ~/.ssh/morgan-scholz-comet-data &>/dev/null

#			export PNPM_HOME="/home/typovrak/.local/share/pnpm"
#			case ":$PATH:" in
#  				*":$PNPM_HOME:"*) ;;
#  				*) export PATH="$PNPM_HOME:$PATH" ;;
#			esac

#			export PATH="$PATH:/home/typovrak/.local/bin"

#			export EDITOR=nvim
			
#			alias v=nvim
#			alias vi=nvim
#			alias vim=nvim
#			
			alias ls="eza -l --icons"

#			alias gittype="nix run github:unhappychoice/gittype"

#			${pkgs.fastfetch}/bin/fastfetch
		'';
	};

#  home-manager.users.${username} = { pkgs, ... }: {
#    home.packages = with pkgs; [ 
      #oh-my-posh 
      #zinit 
      #zoxide 
      #zsh-syntax-highlighting 
      #zsh-autosuggestions 
      #zsh-completions 
      #zsh-fzf-tab 
      #nix-zsh-completions
#    ];

#    programs.bash.enable = true;

#	programs.ssh.enable = true;
#    programs.ssh.settings."*" = {
      #		ForwardAgent = false;
      #		AddKeysToAgent = "no";
      #		Compression = false;
      #		ServerAliveInterval = 0;
      #		ServerAliveCountMax = 3;
      #StrictHostKeyChecking = "accept-new" ;
#		  HashKnownHosts = true;
#      UserKnownHostsFile = "~/.ssh/known_hosts.d/%k";
      #		UserKnownHostsFile = "~/.ssh/known_hosts";
      #		ControlMaster = "no";
      #		ControlPath = "~/.ssh/master-%r@%n:%p";
      #		ControlPersist = "no"
#	  };

#    programs.zsh = {
#      enable = true;
      #enableCompletion = true;
      #autosuggestion.enable = true;
      #syntaxHighlighting.enable = true;
      #initContent =  ''
        # Source/Load zinit
#          source "$HOME/.nix-profile/share/zinit/zinit.zsh"

          # Add in zsh plugins
#          zinit light zsh-users/zsh-syntax-highlighting
#          zinit light zsh-users/zsh-completions
#          zinit light zsh-users/zsh-autosuggestions
#          zinit light Aloxaf/fzf-tab

          # Add in snippets
#          zinit snippet OMZL::git.zsh
#          zinit snippet OMZP::git
#          zinit snippet OMZP::sudo
#          #zinit snippet OMZP::ansible
#          if [ ! -f "~/.cache/zinit/completions/_docker" ]; then
#            mkdir -p ~/.cache/zinit/completions
#            touch ~/.cache/zinit/completions/_docker
#          fi
#          zinit snippet OMZP::docker
#          zinit snippet OMZP::docker-compose
          #zinit snippet OMZP::helm
          #zinit snippet OMZP::debian
          #zinit snippet OMZP::aws
          #zinit snippet OMZP::kubectl
          #zinit snippet OMZP::kubectx
#          zinit snippet OMZP::command-not-found
          #zinit snippet OMZP::aliases
          #zinit snippet OMZP::systemd
          #zinit snippet OMZP::ufw
          #zinit snippet OMZP::miocrok8s
          #zinit snippet OMZP::ssh
          #zinit snippet OMZP::terraform
          #zinit snippet OMZP::tmux
          #zinit snippet OMZP::vagrant
          #zinit snippet OMZP::gh
          #zinit snippet OMZP::genpass
          #zinit snippet OMZP::pip


          # Load completions
#          autoload -Uz compinit && compinit

#          zinit cdreplay -q

#          eval "$(/nix/store/k0w5gwwd6ilmz67r61nllkl06604hhzl-oh-my-posh-29.14.0/bin/oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"
#          #eval "$(oh-my-posh init zsh)"

          # Keybindings
#          bindkey -e
#          bindkey '^p' history-search-backward
#          bindkey '^n' history-search-forward
#          bindkey '^[w' kill-region

          # History
#          HISTSIZE=5000
#          HISTFILE=~/.zsh_history
#          SAVEHIST=$HISTSIZE
#          HISTDUP=erase
#          setopt appendhistory
#          setopt sharehistory
#          setopt hist_ignore_space
#          setopt hist_ignore_all_dups
#          setopt hist_save_no_dups
#          setopt hist_ignore_dups
#          setopt hist_find_no_dups

          # Completion styling
#          zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
#          zstyle ':completion:*' menu no
#          zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
#          zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

          # Aliases
#          alias ls='ls -al --color'
          #alias vim='nvim'
#          alias c='clear'

          # Shell integrations
#          eval "$(fzf --zsh)"
#          eval "$(/nix/store/l3nkkksy5ka5dnrp7y71rwpajj9zb96i-zoxide-0.9.9/bin/zoxide init zsh --cmd cd)"

        #lib.mkOrder 550         
        #  source $HOME/.nix-profile/share/zinit/zinit.zsh
 #       '';
      #shellAliases = {
      #  ll = "ls -l";
      #  update = "sudo nixos-rebuild switch";
#        test = "sudo nixos-rebuild test";
      #};
      #history.size = 10000;
#    };
    
#	programs.oh-my-posh = {
#      enable = true;
#      enableZshIntegration = true;
#      configFile ="$HOME/.config/ohmyposh/zen.toml";
#      configFile ="$HOME/.config/ohmyposh/paradox.omp.json";
#    };

#    programs.zoxide = {
#      enable = true;
#      enableZshIntegration = true;
#      options = [
#        "--cmd cd" 
#      ];
#    };

    # The state version is required and should stay at the version you
    # originally installed.
#    home.stateVersion = "26.05";
 # };

}
