# Set up aliases
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   ## Running on mac OS ##
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
   # G2S2
   alias g2s2sbx="/apollo/env/G2S2CommandTools/bin/g2s2 -u https://g2s2-author.integ.amazon.com"
   alias g2s2="/apollo/env/G2S2CommandTools/bin/g2s2 -u https://g2s2-author.amazon.com"
   alias g2s2ro="/apollo/env/G2S2CommandTools/bin/g2s2 -u https://g2s2-query-pre-prod.amazon.com"
   # ion formatter
   alias ionpp="/apollo/env/G2S2CommandTools/bin/ion-formatter --format pretty"
   # Java switching
   alias print-java-version='printf "\n☕️ Java\n\n" && which java && java -version'
   alias switch-java-version='sudo alternatives --config java && source ~/.zshrc'
   # TAO
   alias taos='tao show -o configuration/application-override.yml'
   alias taou='tao update -o configuration/application-override.yml --no-build'
   alias taod='tao detach -o configuration/application-override.yml'
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
alias bbbr='brc --reverse --allPackages brazil-build'
alias bbra='bbr apollo-pkg'
alias sam='brazil-build-tool-exec sam'

# Override ll to be more useful
alias ll='ls -lAFh'

# Colored cat output
alias ccat='pygmentize -g'

# Search history
alias hh='history | grep'

# Be lazy about initall
alias hi=initall
alias die=termall

