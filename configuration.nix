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
		
#		cp ${./.zshrc} ${home}/.zshrc
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
#		zinit 
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
#			source ${pkgs.zinit}/share/zinit/zinit.zsh
#			eval "$(${pkgs.oh-my-posh}/bin/oh-my-posh init zsh --config ${home}/.config/ohmyposh/paradox.omp.json)"
            eval "$(${pkgs.fzf}/bin/fzf --zsh)"
            eval "$(${pkgs.zoxide}/bin/zoxide init zsh --cmd cd)"
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
			alias ls="eza -al --icons"

#			alias gittype="nix run github:unhappychoice/gittype"

#			${pkgs.fastfetch}/bin/fastfetch
		'';
	};
}
