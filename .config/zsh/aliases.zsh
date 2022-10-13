# Set up aliases
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   ## Running on mac OS ##
   # Initialize Kerberos and Midway
   alias allinit='kinit; mwinit -s --aea'
   # Add directory sync for cloud-desktop remote
   alias cdra='cloud-desktop remote add --host yehyeh.aka.corp.amazon.com -r /workplace -d '
   # Paginated mdcat
   alias mdless='mdcat -p'
   # VPN connect
   alias vpn='~/.config/zsh/scripts/mac/vpn-onetouch'
   # VPN status
   alias vpns='/opt/cisco/anyconnect/bin/vpn status'
   # VPN disconnect
   alias vpnd='/opt/cisco/anyconnect/bin/vpn disconnect'
elif [ "$system_type" = "Linux" ]; then
   ## Running on AL2 ##
   # Initialize Kerberos and Midway
   alias allinit='kinit; mwinit -o -s'
   # Remote Command to skip bastion
   alias rcenv='remote-command --override-ssh "ssh -2 -q -o StrictHostKeyChecking=no -o ProxyCommand=none -t" --environment'
fi

# brazil aliases
alias bb=brazil-build
alias bba='brazil-build apollo-pkg'
alias bre='brazil-runtime-exec'
alias brc='brazil-recursive-cmd'
alias bws='brazil ws'
alias bwsuse='bws use --gitMode -p'
alias bwscreate='bws create -n'
alias brc=brazil-recursive-cmd
alias bbr='brc brazil-build'
alias bball='brc --allPackages'
alias bbb='brc --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias sam='brazil-build-tool-exec sam'

# alias for running brazil commands on all packages
function bap() {
   if [ $# -lt 1 ]; then
      echo 'No command provided.'
      exit 1
   fi
   local cmd
   local div=`printf -- '-%.0s' {1..60}`
   export div
   printf -v cmd 'echo "\n$div"; echo "${name}"; echo "$div"; (%s)' "$*"
   brc -all --continue $cmd
}

# Override ll to be more useful
alias ll='ls -lAFh'

# Colored cat output
alias ccat='pygmentize -g'
