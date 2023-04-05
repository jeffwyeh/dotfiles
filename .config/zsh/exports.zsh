# Set up exports for dev desk and Mac
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   ## mac OS ##

   # Python
   export PATH=$HOME/Library/Python/3.8/bin:$PATH
elif [ "$system_type" = "Linux" ]; then
   ## Linux ##

   # ApolloCommandLine
   export PATH=/apollo/env/ApolloCommandLine/bin:$PATH
   # envImprovement
   export PATH=/apollo/env/envImprovement/bin:$PATH
   # local bin
   export PATH=$HOME/.local/bin:$PATH
   # SDETools
   export PATH=$PATH:/apollo/env/SDETools/bin
   # G2S2 tools
   export PATH=$PATH:/apollo/env/G2S2CommandTools/bin
   # Yehyeh-scripts
   export PATH=$HOME/Yehyeh-scripts/scripts/linux:$PATH
   # OdinTools
   export PATH=$PATH:/apollo/env/OdinTools/bin
fi

# Add platform agnostic Yehyeh-scripts
export PATH=$HOME/Yehyeh-scripts/scripts:$PATH
# Add toolbox
# Add git helper scripts
# Add additional shell scripts
export PATH=$HOME/.config/git/bin:$HOME/.toolbox/bin:$PATH
