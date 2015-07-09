export PATH="~/Code/git/aem-author/crx-quickstart/opt/filevault/vault-cli-3.1.6/bin:/usr/local/bin:/usr/local/sbin:~/bin:/data/db:$PATH"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_67.jdk/Contents/Home
export EDITOR='subl -w'

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

if [ -f ".bash_profile.local" ]; then
  source ".bash_profile.local";
fi;

# increase the history file size to 20,000 lines
export HISTSIZE=20000

# append all commands to the history file, don't overwrite it at the start of every new session
shopt -s histappend
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function proml {
  local        BLUE="\[\033[0;34m\]"
  local        CYAN="\[\033[0;36m\]"
  local         RED="\[\033[0;31m\]"
  local   LIGHT_RED="\[\033[1;31m\]"
  local       GREEN="\[\033[0;32m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local       WHITE="\[\033[1;37m\]"
  local  LIGHT_GRAY="\[\033[0;37m\]"
  local       BLACK="\[\033[0;30m\]"
  local      PURPLE="\[\033[0;35m\]"
  local       BROWN="\[\033[0;33m\]"
  case $TERM in
    xterm*)
    TITLEBAR='\[\033]0;\u@\h:\w\007\]'
    ;;
    *)
    TITLEBAR=""
    ;;
  esac
PS1="$LIGHT_GRAY${TITLEBAR}\W$CYAN\$(parse_git_branch) $LIGHT_GRAY> "
# PS2='| => '
# PS4='+ '

}

proml

# source ~/.git-completion.bash
# Tell ls to be colourful
export CLICOLOR=1

# Tell grep to highlight matches
export GREP_OPTIONS='--color=auto'

# aliases
alias edit='subl'
alias ls='ls -F'
alias ..='cd ../'
alias ...='cd ../../'
alias f='open .'
alias search='find . -name '¡
alias ugh='say I know.'
alias pray='say Lord have mercy.'
alias uh='say What the damn hell?'
alias profile='edit ~/.bash_profile'
alias refresh='source ~/.bash_profile'
alias authstart='cd ~/Code/git/author1/crx-quickstart/bin/ && ./start'
alias authstop='cd ~/Code/git/author1/crx-quickstart/bin/ && ./stop'
alias authbuild='mvn clean install -Pfull -Dgranite.port=4502'
alias authtail='cd ~/Code/git/author1/crx-quickstart/logs/ && tail -f *'
alias pubstart='cd ~/Code/git/publish1/crx-quickstart/bin/ && ./start'
alias pubstop='cd ~/Code/git/publish1/crx-quickstart/bin/ && ./stop'
alias pubbuild='mvn clean install -Pfull'
alias pubtail='cd ~/Code/git/publish1/crx-quickstart/logs/ && tail -f *'
alias brack='open -a Brackets'

alias partial='mvn clean install -Pauto-deploy --settings=../settings.xml'
alias buildview='cd *-view && partial && ..'

j() { cd "$1"; ls; }

go() {
  case $1 in
    dl)
      j ~/Downloads/
      ;;
    git)
      j ~/Code/git/
      ;;
    docs)
      j ~/Documents/
      ;;
    www)
      j ~/Code/git/www-site/
      ;;
    test)
      j ~/Code/test/
      ;;
    *)
      j ~
  esac
}

extract() {
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)  tar xjf $1     ;;
      *.tar.gz)   tar xzf $1     ;;
      *.bz2)      bunzip2 $1     ;;
      *.rar)      unrar e $1     ;;
      *.gz)       gunzip $1      ;;
      *.tar)      tar xf $1      ;;
      *.tbz2)     tar xjf $1     ;;
      *.tgz)      tar xzf $1     ;;
      *.zip)      unzip $1       ;;
      *.Z)        uncompress $1  ;;
      *.7z)       7z x $1        ;;
      *)          echo "'$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}