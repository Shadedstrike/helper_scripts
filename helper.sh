sudo sed -i 's/#\(PasswordAuthentication\) no/\1 yes/; s/#\(PubkeyAuthentication\) yes/\1 yes/; s/#\(Port\) 22/\1 22/' /etc/ssh/sshd_config && sudo systemctl restart ssh
