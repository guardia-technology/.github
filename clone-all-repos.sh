#!bin/bash

declare -A repositories

read -p "Type 1 to clone with HTTPS or 2 SSH? (1 or 2): " user_choice


if [ $user_choice -eq "1" ]; then
    repositories=(
        ["guardia-ir-control"]="https://github.com/guardia-technology/guardia-ir-control.git"
        ["guardia-cloud-functions"]="https://github.com/guardia-technology/guardia-cloud-functions.git"
        ["guardia-mobile-monitor"]="https://github.com/guardia-technology/guardia-mobile-monitor.git"
        ["guardia-thermal-analyzer"]="https://github.com/guardia-technology/guardia-thermal-analyzer.git"
    )
elif [ $user_choice -eq "2" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/github/id_ed25519

    repositories=(
        ["guardia-ir-control"]="git@github.com:guardia-technology/guardia-ir-control.git"
        ["guardia-cloud-functions"]="git@github.com:guardia-technology/guardia-cloud-functions.git"
        ["guardia-mobile-monitor"]="git@github.com:guardia-technology/guardia-mobile-monitor.git"
        ["guardia-thermal-analyzer"]="git@github.com:guardia-technology/guardia-thermal-analyzer.git"
    )
else
    echo "Invalid option $user_choice"
    exit 0
fi


clone_repo () {
    repo_name=$1
    repo_url=$2 

    if [ ! -d  "$repo_name" ]; then
        echo "Clonning repo $repo_url"
        git clone "$repo_url"
    else
        echo "The folder $repo_name alredy exists, skipping..." 
    fi
}

for repo in "${!repositories[@]}"; 
    do clone_repo $repo ${repositories[$repo]}; 
done

echo "Done, all repos were cloned."