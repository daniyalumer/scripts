#!/bin/bash

# Default values
save_path="."
resolution="1920x1080"
file_name="wallpaper"
temp_dir="/tmp"

function print_usage(){
    echo "Usage: $0 [ -p PATH | -t ] [ -o FILENAME ] [ -r RESOLUTION ] [ -d ]"
    echo
    echo "        -p PATH       Save image to the specified PATH."
    echo "        -t            Save image to /tmp directory."
    echo "        -o FILENAME   Save image with the specified filename."
    echo "        -r RESOLUTION Set custom resolution for image in widthxheight format (e.g., 1300x720)."
    echo "        -d            Download a default image with standard settings."
    echo
    echo "Example:"
    echo "        $0 -d -p ~/Desktop -o my-wallpaper -r 1300x720"
}

function convert_resolution(){
    result=$1
    echo "${result//x/\/}"
}

while getopts p:o:r:td opt; do
    case ${opt} in
        p )
            save_path=$OPTARG
            ;;
        o )
            file_name=$OPTARG
            ;;
        r )
            resolution=$(convert_resolution $OPTARG)
            ;;
        t )
            save_path=$temp_dir
            ;;
        d )
            # Default settings can be adjusted here
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

# Debugging output
echo "Save path: $save_path"
echo "File name: $file_name"
echo "Resolution: $resolution"

# Constructing URL and output path
url="https://picsum.photos/$resolution"
output_path="$save_path/$file_name.jpg"

echo "URL: $url"
echo "Output path: $output_path"

# Making sure the directory exists
mkdir -p "$save_path"

# Downloading image
wget -O "$output_path" "$url"

# Checking if the file was downloaded
if [ -f "$output_path" ]; then
    echo "Image Downloaded Successfully"
else
    echo "Failed to download image" 1>&2
fi
