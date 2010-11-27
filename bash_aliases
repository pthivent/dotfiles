# cd
alias ..='cd ..'

#alias la='ls -al'
#alias ll='ls -a'

alias ds='dirs -v'
alias dsl='dirs -L'
alias dss='dirs -S'
alias dsc='dirs -c'

alias psa='ps aux'
alias psu='ps  ux'

alias lpsa="ps aux \!* | p"
alias lpsu="ps  ux \!* | p"

alias dub='du -sclb'
alias duk='du -sclk'
alias dum='du -sclm'
alias duh='du -sclh'

alias dfk='df -PTak'
alias dfm='df -PTam'
alias dfh='df -PTah'
alias dfi='df -PTai'

alias dmsg='dmesg | p'

alias m='more'


#######################
#directory information#
#######################

alias du="du -h"
alias ds="du -h|sort n"
alias dusk="du -s -k -c *| sort -rn"
alias dush="du -s -k -c -h *| sort -rn"
alias t3="tree -L 3 -h"
alias t="tree"
alias dir="dir --color=auto"

#ls
#alias ls="ls --color=auto"
#alias ll="ls -l"
#alias l="ls -CF"
#alias la="ls -la"
alias li="ls -ai1|sort" # sort by index number
alias lt="ls -alt|head -20" # 20, all, long listing, modification time
alias lh="ls -Al" # show hidden files
alias lx="ls -lXB" # sort by extension
alias lk="ls -lSr" # sort by size
alias lss="ls -shAxSr" # sort by size
alias lc="ls -lcr" # sort by change time
alias lu="ls -lur" # sort by access time
alias ld="ls -ltr" # sort by date
alias lm="ls -al|more" # pipe through ‘more’
alias lsam="ls -am" # List files horizontally
alias lr="ls -lR" # recursive
alias lsx="ls -ax" # sort right to left rather then in columns
alias lh="ls -lAtrh" # sort by date and human readable

#top10 largest in directory
t10(){
pwd&&du -ab $1|sort -n -r|head -n 10
}

#top10 apparent size
t10a(){
pwd&&du -ab --apparent-size $1|sort -n -r|head -n 10
}


#dsz - finds directory sizes and lists them for the current directory
dsz (){
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm /tmp/list
}

#################################
#file and directory manipulation#
#################################

alias n="nano"
alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"
alias dclr="find . -maxdepth 1 -type f -exec rm {} \;" #clean out directory,leaving intact

###############
# Git aliases #
###############

# git
alias gl='git pull'
alias gp='git push'
#alias gpom="git push origin master"
alias gd='git diff'
alias gc='git commit'
alias gca='git commit -a'
alias gco='git checkout'
alias gb='git branch'
alias gs='git status'
alias grm="git status | grep deleted | awk '{print \$3}' | xargs git rm"
alias changelog='git log `git log -1 --format=%H -- CHANGELOG*`..; cat CHANGELOG*'

### UPDATE ME ###
function git-help() {
  echo "Git Custom Aliases Usage"
  echo
echo " gcl = git clone"
  echo " g = git"
  echo " get = git"
  echo " ga = git add"
  echo " gall = git add ."
  echo " gst/gs = git status"
  echo " gss = git status -s"
  echo " gl = git pull"
  echo " gup = git fetch && git rebase"
  echo " gp = git push"
  echo " gd = git diff | mate"
  echo " gdv = git diff -w \"$@\" | vim -R -"
  echo " gc = git commit -v"
  echo " gca = git commit -v -a"
  echo " gb = git branch"
  echo " gba = git branch -a"
  echo " gcount = git shortlog -sn"
  echo " gcp = git cherry-pick"
  echo " gco = git checkout"
  echo " gexport = git git archive --format zip --output"
echo " gdel = git branch -D"
echo " gpo = git push origin"
  echo
}


