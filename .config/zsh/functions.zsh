# set up system specific items
# the Linux portions are specific to AL2
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   ## Running on mac OS ##
   # jenv setup
   eval export PATH="/Users/yehyeh/.jenv/shims:${PATH}"
   export JENV_SHELL=zsh
   export JENV_LOADED=1
   unset JAVA_HOME
   source '/usr/local/Cellar/jenv/0.5.5_2/libexec/libexec/../completions/jenv.zsh'
   jenv rehash 2>/dev/null
   jenv refresh-plugins
   jenv() {
     typeset command
     command="$1"
     if [ "$#" -gt 0 ]; then
       shift
     fi
     case "$command" in
     enable-plugin|rehash|shell|shell-options)
       eval `jenv "sh-$command" "$@"`;;
     *)
       command jenv "$command" "$@";;
     esac
   }
elif [ "$system_type" = "Linux" ]; then
   ## Running on AL2 ##
fi

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

# print calendars vertically
function vcal() {
   if [ "$system_type" = "Darwin" ]; then
      LAST_MONTH=`date -v-1m '+%-m'`
      LAST_YEAR=`date -v-1m '+%Y'`
      NEXT_MONTH=`date -v+1m '+%-m'`
      NEXT_YEAR=`date -v+1m '+%Y'`
   elif [ "$system_type" = "Linux" ]; then
      LAST_MONTH=`date -d '-1 month' '+%-m'`
      LAST_YEAR=`date -d '-1 month' '+%Y'`
      NEXT_MONTH=`date -d '+1 month' '+%-m'`
      NEXT_YEAR=`date -d '+1 month' '+%Y'`
   fi

   cal $LAST_MONTH $LAST_YEAR
   cal
   cal $NEXT_MONTH $NEXT_YEAR
}
