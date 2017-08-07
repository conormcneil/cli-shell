#!/bin/sh

# Clear terminal window for clarity of view
clear

# Define color variables
clired=$(tput setaf 1)
cliblue=$(tput setaf 4)
cligreen=$(tput setaf 2)
cliwhite=$(tput setaf 7)

# Begin script
function myCli() {
    PROJ=$1
    
    # verify that project was provided by user
    if [ -z ${PROJ} ];
    then
        # what happens if this is made an empty string? how does the following 
        # if/else statement evaluate?
        PROJ="none provided"
    fi
    
    # Catch project variable and configure cwd accordingly
    if [ "$PROJ" = "olaf" ];
    then
        CWD="/home/conor/workspace/olaf_client"
    elif [ "$PROJ" = "olaf1" ];
    then
        CWD="/home/conor/workspace/olaf"
    elif [ "$PROJ" = "cli" ];
    then
        CWD="/home/conor/workspace/workshop/cli"
    elif [ "$PROJ" = "national-day" ];
    then
        CWD="/home/conor/workspace/workshop/national-day"
    elif [ "$PROJ" = "nd" ];
    then
        CWD="/home/conor/workspace/workshop/national-day"
    elif [ "$PROJ" = "cli-shell" ];
    then
        CWD="/home/conor/workspace/workshop/cli-shell"
    elif [ "$PROJ" = "clish" ];
    then
        CWD="/home/conor/workspace/workshop/cli-shell"
    elif [ "$PROJ" = "none provided" ];
    then
        CWD=$(pwd)
    else
        echo "${clired}Unknown project: ${PROJ}${cliwhite}"
    fi
    
    # Change to cwd
    cd ${CWD}
    
    echo "${cliblue}Changed to cwd: ${CWD}${cliwhite}"
    
    
    # Construct variable length string to behave as underline for the
    # echo statement above
    bar="================"
    
    # loops through range - from 1 to length of CWD string.
    for i in {1..${#CWD}}
    do
        bar="$bar="
    done
    
    echo "${cliblue}${bar}${cliwhite}"
    echo ""
    
    # Print git branch && git status
    echo "${cliblue}git status:${cliwhite}"
    echo "${cliblue}===========${cliwhite}"
    git status
    echo ""
    
    echo "${cliblue}git branch:${cliwhite}"
    echo "${cliblue}===========${cliwhite}"
    git branch
}

# method invocation
myCli ${1}