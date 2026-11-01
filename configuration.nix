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
		
#		cp ${./.zshrc} ${home}/.zshrc
		chown ${username}:${group} ${home}/.zshrc
		chmod 600 ${home}/.zshrc

		touch ${home}/.zsh_history
		chown ${username}:${group} ${home}/.zsh_history
		chmod 600 ${home}/.zsh_history
	'';

	users.users.${username} = {
		shell = pkgs.zsh;
	};

	environment.systemPackages = with pkgs; [
		zsh
		zsh-autosuggestions
		zsh-syntax-highlighting
		oh-my-posh
		zoxide 
		zsh-fzf-tab 
        nix-zsh-completions
		eza
	];

	programs.zsh = {
		enable = true;
#		enableCompletion = true;
		promptInit = ''
#			autoload -Uz compinit
#			compinit

			source ${pkgs.zsh-autosuggestions}/share/zsh-autosuggestions/zsh-autosuggestions.zsh
			source ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
            eval "$(${pkgs.fzf}/bin/fzf --zsh)"
            eval "$(${pkgs.zoxide}/bin/zoxide init zsh --cmd cd)"

			alias ls="eza -al --icons"

#			${pkgs.fastfetch}/bin/fastfetch
		'';
	};
}
