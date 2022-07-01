# Set up aliases
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   ## Running on mac OS ##
   # Initialize Kerberos and Midway
   alias initall='kinit; mwinit -s --aea'
   # Add directory sync for cloud-desktop remote
   alias cdra='cloud-desktop remote add --host yehyeh.aka.corp.amazon.com -r /workplace -d '
   # Paginated mdcat
   alias mdless='mdcat -p'
elif [ "$system_type" = "Linux" ]; then
   ## Running on AL2 ##
   # Initialize Kerberos and Midway
   alias initall='kinit; mwinit -o -s'
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

# Override ll to be more useful
alias ll='ls -lAFh'

# Colored cat output
alias ccat='pygmentize -g'