# Set up exports for dev desk and Mac
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   ## mac OS ##

   # Python
   export PATH=$HOME/Library/Python/3.8/bin:$PATH
elif [ "$system_type" = "Linux" ]; then
   ## Linux ##

   # envImprovement - PUT IT FIRST
   export PATH=/apollo/env/envImprovement/bin:$PATH
   # ApolloCommandLine
   export PATH=$PATH:/apollo/env/ApolloCommandLine/bin
   # local bin
   export PATH=$PATH:$HOME/.local/bin
   # SDETools
   export PATH=$PATH:/apollo/env/SDETools/bin
   # G2S2 tools
   export PATH=$PATH:/apollo/env/G2S2CommandTools/bin
   # Yehyeh-scripts
   export PATH=$HOME/Yehyeh-scripts/scripts/linux:$PATH
   # OdinTools
   export PATH=$PATH:/apollo/env/OdinTools/bin
   # NodeJS
   export PATH=$PATH:/apollo/env/NodeJS/bin
   # Node Modules
   export PATH=$PATH:/home/yehyeh/node_modules/.bin
   # Java Home for TAO
   export JAVA_HOME=/usr/lib/jvm/java-11-amazon-corretto
fi

# Add platform agnostic Yehyeh-scripts
export PATH=$PATH:$HOME/Yehyeh-scripts/scripts
# Add toolbox
# Add git helper scripts
# Add additional shell scripts
export PATH=$PATH:$HOME/.config/git/bin:$HOME/.toolbox/bin
