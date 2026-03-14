# ~/.oh-my-zsh/custom/aliases.zsh

# general
alias help="man"
alias t="tail -f"
alias ff="find . -type f -name"
#(($ + commands[fd])) || alias fd='find . -type d -name'
alias grep="grep --color"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS}"
alias processes="ps -f"

# alias to avoid making mistakes
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# networking
alias ports="netstat -tulnp | grep LISTEN"
alias router="ip route | grep default"
alias ip-private="hostname -I | awk {'print $1}'"
alias ip-public="curl -4 ifconfig.co"

# environment
alias env-export="export \$(cat .env)"
path-add() {
  export PATH=$PATH:$1
}

# alternatively, use the 'take' command
mkdircd() {
  mkdir $1
  cd $1
}

# backup file
bak() {
  cp -r $1{,.bak}
}

# change owner to me
claim() {
  sudo chown -R $USER $1
}

# file size
alias size-file-list="du -d 1 -ah | sort -h -r"
size-file() {
  du -h $1
}

# directory size
alias size-dir-list="du -d 1 -h | sort -h -r"
size-dir() {
  du -hs $1
}

# tar
compress() {
  tar -czvf archive.tar.gz $1
}
decompress() {
  tar -zxv -f $1
}
