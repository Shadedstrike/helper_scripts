sudo sed -i 's/#\(PasswordAuthentication\) no/\1 yes/; s/#\(PubkeyAuthentication\) yes/\1 yes/; s/#\(Port\) 22/\1 22/' /etc/ssh/sshd_config && 
sudo apt update && sudo apt install -y zsh git wget && 
sudo systemctl restart ssh && sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" &&
 git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k && echo '
# Enable Powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git)
source $ZSH/oh-my-zsh.sh

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"
alias push="git push"
alias pull="git pull"
alias commit="git commit"
alias add="git add"
alias re="source ~/.zshrc && echo 'z-shell reloaded!'"
alias zshrc="vim ~/.zshrc"

export PATH="/usr/local/go/bin:$HOME/go/bin:/bin:/usr/bin:/usr/local/bin:$PATH"
' > ~/.zshrc && source ~/.zshrc
