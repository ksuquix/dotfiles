# $Id: .bashrc,v 1.52 2014/07/23 20:53:50 quixote Exp $
#  OS'es this is made to work reasonably ok in:
#  Linux  (specifically redhat)
#  Solaris (specifically 2.5.1 - 2.8)
#  CYGWIN (CYGWIN_NT-5.1  1.3.22(0.78/3/2)) 

myos=`uname -s`

export PATH=${HOME}/bin:${HOME}/.local/bin:/usr/local/bin:/usr/local/sbin:$PATH:/usr/sbin:/sbin
if [ "$UID" = "0" ]; then
  PATH=/root/bin:$PATH
fi

export MANPATH=${MANPATH}:${HOME}/man

export EDITOR=vi
export PAGER=less
export LESS="-M -n -q -i -r"

# Reset
Color_Off='\[\e[0m\]'       # Text Reset

# Regular Colors
Black='\[\e[0;30m\]'        # Black
Red='\[\e[0;31m\]'          # Red
Green='\[\e[0;32m\]'        # Green
Yellow='\[\e[0;33m\]'       # Yellow
Blue='\[\e[0;34m\]'         # Blue
Purple='\[\e[0;35m\]'       # Purple
Cyan='\[\e[0;36m\]'         # Cyan
White='\[\e[0;37m\]'        # White

# Bold
BBlack='\[\e[1;30m\]'       # Black
BRed='\[\e[1;31m\]'         # Red
BGreen='\[\e[1;32m\]'       # Green
BYellow='\[\e[1;33m\]'      # Yellow
BBlue='\[\e[1;34m\]'        # Blue
BPurple='\[\e[1;35m\]'      # Purple
BCyan='\[\e[1;36m\]'        # Cyan
BWhite='\[\e[1;37m\]'       # White

# Underline
UBlack='\[\e[4;30m\]'       # Black
URed='\[\e[4;31m\]'         # Red
UGreen='\[\e[4;32m\]'       # Green
UYellow='\[\e[4;33m\]'      # Yellow
UBlue='\[\e[4;34m\]'        # Blue
UPurple='\[\e[4;35m\]'      # Purple
UCyan='\[\e[4;36m\]'        # Cyan
UWhite='\[\e[4;37m\]'       # White

# Background
On_Black='\[\e[40m\]'       # Black
On_Red='\[\e[41m\]'         # Red
On_Green='\[\e[42m\]'       # Green
On_Yellow='\[\e[43m\]'      # Yellow
On_Blue='\[\e[44m\]'        # Blue
On_Purple='\[\e[45m\]'      # Purple
On_Cyan='\[\e[46m\]'        # Cyan
On_White='\[\e[47m\]'       # White

# High Intensity
IBlack='\[\e[0;90m\]'       # Black
IRed='\[\e[0;91m\]'         # Red
IGreen='\[\e[0;92m\]'       # Green
IYellow='\[\e[0;93m\]'      # Yellow
IBlue='\[\e[0;94m\]'        # Blue
IPurple='\[\e[0;95m\]'      # Purple
ICyan='\[\e[0;96m\]'        # Cyan
IWhite='\[\e[0;97m\]'       # White

# Bold High Intensity
BIBlack='\[\e[1;90m\]'      # Black
BIRed='\[\e[1;91m\]'        # Red
BIGreen='\[\e[1;92m\]'      # Green
BIYellow='\[\e[1;93m\]'     # Yellow
BIBlue='\[\e[1;94m\]'       # Blue
BIPurple='\[\e[1;95m\]'     # Purple
BICyan='\[\e[1;96m\]'       # Cyan
BIWhite='\[\e[1;97m\]'      # White

# High Intensity backgrounds
On_IBlack='\[\e[0;100m\]'   # Black
On_IRed='\[\e[0;101m\]'     # Red
On_IGreen='\[\e[0;102m\]'   # Green
On_IYellow='\[\e[0;103m\]'  # Yellow
On_IBlue='\[\e[0;104m\]'    # Blue
On_IPurple='\[\e[0;105m\]'  # Purple
On_ICyan='\[\e[0;106m\]'    # Cyan
On_IWhite='\[\e[0;107m\]'   # White

if [ ! -z "$SSH_CLIENT" ]; then
  export REMOTEHOST=${SSH_CLIENT%% *}
fi

umask 002

# General shell tools

function iflastdo {
    # if last executed thing was successful, execute the arguments
    if [ "$?" -eq 1 ] ; then
        $1
    fi
}

# tmux
function has-session {
    # $? = success if tmux session exists
    tmux has-session -t $1 2>/dev/null
}
function session-test {
    tmux new-session -d -s test
    tmux neww -k -t test:1
}

# end tools

# Things set for interactive shells
if [ ! -z "$PS1" ];then
  #set prompt="`uname -n`% "
  #set prompt = '%m/%~>'
  if [ "$LOGNAME" != "$USER" ]; then
    if [ "$LOGNAME" = "root" ]; then 
      LOGNAME="$USER"
      BASEUSER="$USER"
    else
      if [ -z "$LOGNAME" ]; then 
         LOGNAME="$USER"
         BASEUSER="$USER"
      else 
        if [ -z "$USER" ]; then
           USER="$LOGNAME"
          BASEUSER="$USER"
        else
           BASEUSER="$LOGNAME LOGNAME not right?"
        fi
      fi
    fi
  else
    BASEUSER=$LOGNAME
  fi
  if [ -z "$HOST" ]; then
    export HOST=`hostname`
  fi
  if [ -z "$HOSTNAME" ]; then
    export HOSTNAME=`hostname`
  fi

  TTY=`tty | cut -d/ -f3-`
  case "${BASEUSER}" in
    eisele)
       BASESHORT="eis" ;;
    quixote)
       BASESHORT="quix" ;;
    aikido)
       BASESHORT="aik" ;;
    iab)
       BASESHORT="iab" ;;
    natsune)
       BASESHORT="nat" ;;
    odc)
       BASESHORT="odc" ;;
    quixcraft)
       BASESHORT="qcraft" ;;
    smash)
       BASESHORT="smash" ;;
    spin)
       BASESHORT="spin" ;;
    tengaicon)
       BASESHORT="con" ;;
    toys)
       BASESHORT="toys" ;;
    *)
       BASESHORT="${BASEUSER}"
  esac
  case "${HOSTNAME}" in
    insanity)
       HOSTSHORT="ins" ;;
    ubuntu-dev)
       HOSTSHORT="dev" ;;
    tora)
       HOSTSHORT="tora" ;;
    *)
       HOSTSHORT="${HOSTNAME}"
  esac
#aikido,eisele,iab,natsune,odc,quixcraft,smash,spin,tengaicon,toys


  function wordfind() {
      egrep "$*" /usr/share/dict/words
  }
  function xtitle() {
    echo -en \\\033]0\;"$*" \\\007
#    * ESC]0;stringBEL -- Set icon name and window title to string
#    * ESC]1;stringBEL -- Set icon name to string
#    * ESC]2;stringBEL -- Set window title to string
  }
  function chtitle() {
    PROMPT_COMMAND="xtitle $*"
  }
  function nullroute-iptables() {
     iptables -I INPUT -s "$*" -j DROP
  }

  # Show Git branch/tag, or name-rev if on detached head
  function parse_git_branch() {
	  (git rev-parse --abbrev-ref HEAD) 2>/dev/null
#      (git name-rev --name-only --no-undefined --always HEAD || git symbolic-ref -q HEAD) 2> /dev/null
  }
  
  # Show different symbols as appropriate for various Git repository states
  function parse_git_state() {
      
      # Compose this value via multiple conditional appends.
      local GIT_STATE=""
      
      local NUM_AHEAD="$(git log --oneline @{u}.. 2> /dev/null | wc -l | tr -d ' ')"
      if [ "$NUM_AHEAD" -gt 0 ]; then
	  GIT_STATE=$GIT_STATE${GIT_PROMPT_AHEAD//NUM/$NUM_AHEAD}
      fi

      local NUM_BEHIND="$(git log --oneline ..@{u} 2> /dev/null | wc -l | tr -d ' ')"
      if [ "$NUM_BEHIND" -gt 0 ]; then
	  GIT_STATE=$GIT_STATE${GIT_PROMPT_BEHIND//NUM/$NUM_BEHIND}
      fi

      local GIT_DIR="$(git rev-parse --git-dir 2> /dev/null)"
      if [ -n $GIT_DIR ] && test -r $GIT_DIR/MERGE_HEAD; then
	  GIT_STATE=$GIT_STATE$GIT_PROMPT_MERGING
      fi

      if [[ -n $(git ls-files --other --exclude-standard 2> /dev/null) ]]; then
	  GIT_STATE=$GIT_STATE$GIT_PROMPT_UNTRACKED
      fi

#      if ! git diff --quiet 2> /dev/null; then
#	  GIT_STATE=$GIT_STATE$GIT_PROMPT_MODIFIED
#      fi
      
      if ! git diff --cached --quiet 2> /dev/null; then
	  GIT_STATE=$GIT_STATE$GIT_PROMPT_STAGED
      fi

      if [[ -n $GIT_STATE ]]; then
	  echo "$GIT_PROMPT_PREFIX$GIT_STATE$GIT_PROMPT_SUFFIX"
      fi

  }

  # If inside a Git repository, print its branch and state
  function git_prompt_string() {
      local git_where="$(parse_git_branch)"
      [ -n "$git_where" ] && echo "git/${git_where#(refs/heads/|tags/)}$(parse_git_state) "
  }

  GPRO=$(git_prompt_string)
#  PROMPT_COMMAND="echo -n \": \$(date +%m%d:%H:%m) \$(git_prompt_string)\""

  if [ "$TERM" != "dumb" ]; then
      shopt -s checkwinsize
      export PS1=": ${Cyan}\$(date '+%m/%d/%y %H:%M:%S')${Color_Off} ${BASEUSER}@\h ${Yellow}\w${Color_Off} ${IGreen}\$(git rev-parse --abbrev-ref HEAD 2>/dev/null)${Color_Off}\\\$; "
      export LOCALE=en_US.iso88591
  fi

  if [ "$TERM" = "xterm" ] || [ "$TERM" = "vt100" ] || [ "$TERM" = "xterm-256color" ];then 
      if [ -z "$STY" ]; then
	  PROMPT_COMMAND="xtitle ${BASESHORT}@${HOSTSHORT} \${PWD} \$(git_prompt_string)last:\"\`history 1|tr -d \'[:cntrl:]\'|sed -e 's/^ *[0-9]* *//'\`\""
	  #    else 
	  #	PROMPT_COMMAND="xtitle screen ${BASEUSER}@${HOSTNAME}:\${PWD} $$\#\"\`history 1|tr -d \'[:cntrl:]\'\`\""
      fi
  fi
  
  #I think these are fixes for a problem that doesn't happen anymore
  # if [ "$TERM" = "xterm" ] && [ "$myos" = "Linux" ]; then
  #    export TERM=vt100
  # fi
  # if [ "$TERM" = "linux" ]; then
  #     export TERM=vt100
  # fi
  # if [ "$TERM" = "vt320" ]; then
  #     export TERM=xterm
  # fi
  # if [ "$TERM" = "screen" ]; then
  #     stty erase '^?'
  # fi
  # if [ "$TERM" = "screen" ] && [ "$myos" = "SunOS" ]; then
  #     TERM=xterm
  # fi

# move these to machine local... also old old old
  # export CVS_RSH=ssh
  # if [ -z "$CVSROOT" ]; then
  #     if [ "$HOST" = "tora.toysmakeuspowerful.com" ] || [ "$HOST" = "tora" ]; then
	#   export CVSROOT=/home/quixote/cvsroot
  #     else
	#   if [ "$HOST" = "amber.greyhelm.com" ]; then
	#       export CVSROOT=/home/digi/cvsroot
	#   else
	#       if [ "$HOST" = "invidious" ]; then
	# 	  export CVSROOT=/usr/local/keas/cvsroot
	#       else
	# 	  export CVSROOT=:ext:quixote@gw.tmup.net:/home/quixote/cvsroot
	#       fi
	#   fi
  #     fi
  # fi
  # alias invcvs="export CVSROOT=:ext:eisele@insanity.ksu.ksu.edu:/net/invidious/usr/local/keas/cvsroot"
  # alias cnscvs="export CVSROOT=:ext:eisele@unix.ksu.edu:/remotefs/src/cvs/cvs"
  # alias quixcvs="export CVSROOT=:ext:quixote@gw.toysmakeuspowerful.com:/home/quixote/cvsroot"
  # alias digicvs="export CVSROOT=:ext:digi@amber.greyhelm.com:/home/digi/cvsroot"
  # alias omecvs="export CVSROOT=:ext:eisele@cvs.ome.ksu.edu:/as/data/cvsroot"
  # alias nls="/bin/ls"
  alias emacs='emacs -title "emacs:$USER@$HOST" "$@"'
  if [ -e "/Applications/Emacs.app" ]; then
      alias emacs='/Applications/Emacs.app/Contents/MacOS/Emacs -title "emacs:$USER@$HOST" "$@"'
  fi
  function pptree() {
   for pptreepid in `pgrep  $*` 
    do 
      echo $pptreepid: 
      # note: linux has -h flag, but solaris doesn't (grep -v...)
      pptreepidlist=`pgrep -P $pptreepid`
      if [ "$pptreepidlist" != "" ]; then
        ps -fp $pptreepidlist |sed -e "s/^/  /"|grep -v "UID.*CMD"
      fi
    done
  }
  
  export HISTFILESIZE=5000
  export IGNOREEOF=2
  export TMOUT=0
  unset noclobber
  shopt > /dev/null 2>&1
  if [ $? = 0 ]; then
    shopt -s cdable_vars
    shopt -s checkwinsize
#    shopt -s cdspell
  else
    export cdable_vars=1
  fi
  stty -ixon
  export HOSTFILE=$HOME/.hosts
  export src=/usr/local/src
  export data=/usr/local/data
  unset MAILCHECK
  ulimit -c 0
  if [ -f "$HOME/bin/quixbash.local" ]; then
     . $HOME/bin/quixbash.local
  fi
  if [ -f "$HOME/bin/quixbash.local-$HOST" ]; then
     . $HOME/bin/quixbash.local-$HOST
  fi
  if [ -f "/etc/bash_completion.d/acroread.sh" ]; then
    echo "WARNING:   /etc/bash_completion.d/acroread.sh installed.  remove it."
  fi
  for ai in {1..30}
  do
      alias a$ai="awk '{print \$$ai}'"
  done
  function headme() {
    IFS= read -r header
    printf '%s\n' "$header"
    "$@"
  }
  function awsp() {
    export AWS_PROFILE="$@"
  }
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
