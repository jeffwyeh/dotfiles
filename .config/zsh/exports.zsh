# Set up exports for dev desk and Mac
system_type=$(uname -s)
if [ "$system_type" = "Darwin" ]; then
   # mac OS
   # Python
   export PATH=$HOME/Library/Python/3.8/bin:$PATH
elif [ "$system_type" = "Linux" ]; then
   # Linux
   # ApolloCommandLine
   export PATH=/apollo/env/ApolloCommandLine/bin:$PATH
   # envImprovement
   export PATH=/apollo/env/envImprovement/bin:$PATH
   # local bin
   export PATH=$HOME/.local/bin:$PATH
   # SDETools
   export PATH=/apollo/env/SDETools/bin:$PATH
fi

# Add toolbox
# Add git helper scripts
export PATH=$HOME/.config/git/bin:$HOME/.toolbox/bin:$PATH

