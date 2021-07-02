# override ll
alias ll='ls -lAFh'

# quick authentication
alias initall='kinit && mwinit'

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

# alias for running commands on all packages
function bap {
   if [ $# -lt 1 ]; then
      echo 'No command provided.'
      return 1
   fi
   local cmd
   local div=`printf -- '-%.0s' {1..60}`
   export div
   printf -v cmd 'echo "\n$div"; echo "${name}"; echo "$div"; (%s)' "$*"
   brc -all --continue $cmd
}
