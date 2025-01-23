sudo sed -i 's/#\(PasswordAuthentication\) no/\1 yes/; s/#\(PubkeyAuthentication\) yes/\1 yes/; s/#\(Port\) 22/\1 22/' /etc/ssh/sshd_config &&
sudo apt update &&
sudo apt install -y zsh git wget && 
sudo systemctl restart ssh && 
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" &&
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k &&
echo '
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
' > ~/.zshrc && source ~/.zshrc &&

# Incorporate public SSH key for passwordless login
mkdir -p ~/.ssh &&
chmod 700 ~/.ssh &&
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC1Hjak68C83BkjFKsOf4GmSzVPYg88DNqXUM6bUI8aYFE1HBUMLIQ9EJMB3658GGhtJUlEvV7eeZ9CF40P7QoiU0eZ5HgDAeMXKdMtAXJcI9pmOn2ycoVOOCtazHRB0voWw+BrHTSChoj27IjFxbdZXRK81bEprQqJ+rxTygl/+K5gnkmxzcMemQI7MbN4JZ8LgAbdCmWcztRwhCAZSUP7SXOuvxlNox+q4IqPjNKV2nsFTobRMES1LgtAMEgAle2dXHZyhYYxAs4jVl0oKCy02F9cn+KRyJKyetlxqBcq0gzaxW7Hfucr9ImIEkcqbbw3aqL3yZQKwYbB0JcJxjDcYp99MvlyYCPMfguBX4clSJPnPN4yWiUK2CO0FCZgnPtJi+n/bQhzYVZQ/hebIQwdgpCfnnuvvXHJBuCohMWY86adOM1mbmaL9f7J6X290dtR1l3c5DZ76XSOjZPVgjLptG7p5cunP+FA+CyVoZTu1ALm2xPD1VdPXGsxatRwZUc=" >> ~/.ssh/authorized_keys &&
chmod 600 ~/.ssh/authorized_keys

sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh

