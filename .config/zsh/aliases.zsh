# set up system specific items
# the Linux portions are specific to AL2
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   # Running on mac OS
   alias initall='kinit && mwinit -s --aea'
   alias cdra='cloud-desktop remote add --host yehyeh.aka.corp.amazon.com -r /workplace -d '

   # jenv setup
   eval export PATH="/Users/yehyeh/.jenv/shims:${PATH}"
   export JENV_SHELL=zsh
   export JENV_LOADED=1
   unset JAVA_HOME
   source '/usr/local/Cellar/jenv/0.5.4/libexec/libexec/../completions/jenv.zsh'
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
   # Running on AL2
   alias initall='kinit && mwinit -o -s'


   # Deploy an environment
   function deploy-env {
      # check num args
      if [ "$#" -gt 2 ] || [ "$#" -lt 1 ] ; then
         echo "\nInvalid number of arguments.\n"
         echo "Usage:"
         echo "   deploy-env <sic|sips|sirms|sisils|siss|siws|other> [-f]"
         return 1
      fi

      # check if forced flag is set
      forced=false
      if [ "$#" -eq 2 ] ; then
         if [ "$2" = "-f" ] ; then
            forced=true
         else
            echo "\nInvalid argument(s).\n"
            echo "Usage:"
            echo "   deploy-env <sic|sips|sirms|sisils|siss|siws|other> [-f]"
            return 1
         fi
      fi

      # parse the target environment and check for validity
      valid_target=true
      case $1 in
         "sic")
            target_env="ShipmentInjectionConsole"
            ;;
         "sips")
            target_env="ShipmentInjectionPreviewService"
            ;;
         "sirm")
            target_env="ShipmentInjectionRequestManager"
            ;;
         "sisil")
            target_env="ShipmentInjectionSILService"
            ;;
         "siss")
            target_env="ShipmentInjectionStatusService"
            ;;
         "siws")
            target_env="ShipmentInjectionWorkflowService"
            ;;
         *)
            target_env=$1
            valid_target=false
            ;;
      esac

      if [ "$forced" = true ] || [ "$valid_target" = true ] ; then
         echo "\nDeploying $target_env:\n"
         # if forced or a valid target, run the command
         brazil ws env update
         sudo /apollo/bin/runCommand -a Deactivate -e $target_env
         sudo /apollo/bin/runCommand -a Activate -e $target_env
      else
         echo "\nInvalid target environment. Use '-f' to force deployment.\n"
         echo "Usage:"
         echo "   deploy-env <sic|sips|sirm|sisils|siss|siws|other> [-f]"
      fi
   }

   ## sync an apollo environment from it's parent NA beta
   function apollo-parent-sync {
      # check num args
      if [ "$#" -ne 1 ] ; then
         echo "\nInvalid number of arguments.\n"
         echo "Usage:"
         echo "   apollo-parent-sync <env/stage>"
         return 1
      fi

      # parse arg
      env=${1%/*}
      stage=${1##*/}

      echo "Syncing $env/NA/$stage to $env/NA/yehyeh/$stage\n"
      output=$(/apollo/env/ApolloCommandLine/bin/apollo sync --source-environment-stage $env/NA/$stage $env/NA/yehyeh/$stage)
      deploymentid=$(echo $output | jq '.deployment_id')
      echo "https://apollo.amazon.com/deployments/$deploymentid"
   }

   ## deploy an apollo environment based on the current brazil WS
   function apollo-deploy-ws {
      if [ "$#" -ne 1 ] ; then
         echo "\nInvalid number of arguments.\n"
         echo "Usage:"
         echo "   apollo-deploy-ws <env/stage>"
         return 1
      fi
      
      # parse arg
      env=${1%/*}
      stage=${1##*/}

      # get the VFI to deploy
      vs=$(brazil ws show | awk '/Version Set:/{sub(/.*Version Set:\s*/, ""); print}' | sed -r 's/@/@B/g')
      echo "Deploying $vs to $env/NA/yehyeh/$stage\n"
      output=$(apollo deploy --version-set-revision $vs $env/NA/yehyeh/$stage)
      deploymentid=$(echo $output | jq '.deployment_id')
      echo "https://apollo.amazon.com/deployments/$deploymentid"
   }
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

# Colored output for cat and less
alias ccat='pygmentize -g'
function cless() {
   if ! [ -x "$(command -v pygmentize)" ]; then
      echo 'Missing prerequisite: pygmentize'
      return 1
   elif [ $# -lt 1 ]; then
      echo 'Missing filename'
      return 1
   fi
   pygmentize -g $1 | less -R
}

# mcurl
function mcurl() {
  /usr/bin/curl "$@" -L --cookie ~/.midway/cookie --cookie-jar ~/.midway/cookie
}

