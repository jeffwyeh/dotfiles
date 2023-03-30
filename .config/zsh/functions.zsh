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
