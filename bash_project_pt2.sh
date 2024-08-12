#!/bin/bash

# Default values
script_source="$HOME/scripts/bash_project.sh"
script_destination="$HOME/bash_project.sh"
cron_interval="daily"  # Default interval

function print_usage(){
    echo "Usage: $0 [ -s SOURCE ] [ -i INTERVAL ]"
    echo
    echo "        -s SOURCE      Source path of the script to copy (default: $HOME/scripts/bash_project.sh)."
    echo "        -i INTERVAL    Set interval for the cron job (e.g., 'daily', 'hourly', 'weekly')."
    echo
    echo "Example:"
    echo "        $0 -s ~/scripts/bash_project.sh -i daily"
}

function setup_cron_job(){
    local interval=$1
    local script_path="$script_destination"

    case $interval in
        hourly)
            cron_time="0 * * * *"
            ;;
        daily)
            cron_time="0 0 * * *"
            ;;
        weekly)
            cron_time="0 0 * * 0"
            ;;
        *)
            echo "Invalid interval: $interval"
            exit 1
            ;;
    esac

    # Adding the cron job
    (crontab -l 2>/dev/null; echo "$cron_time $script_path -p $HOME -o wallpaper -r 1920x1080") | crontab -
    echo "Cron job set up to run $interval."
}

while getopts s:i:h opt; do
    case ${opt} in
        s )
            script_source=$OPTARG
            ;;
        i )
            cron_interval=$OPTARG
            ;;
        h )
            print_usage
            exit 1
            ;;
        \? )
            print_usage
            exit 1
            ;;
        : )
            echo "Invalid option: -$OPTARG requires an argument" 1>&2
            print_usage
            exit 1
            ;;
    esac
done

shift $((OPTIND - 1))

cp "$script_source" "$script_destination"
if [ $? -eq 0 ]; then
    echo "Script copied successfully to $script_destination"
else
    echo "Failed to copy the script" 1>&2
    exit 1
fi

# Set up cron job if specified
if [ "$cron_interval" != "none" ]; then
    setup_cron_job "$cron_interval"
fi

