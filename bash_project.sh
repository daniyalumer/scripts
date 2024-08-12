#default values
save_path="."
resolution="1920x1080"
file_name="wallpaper"

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

while getopt p:o:r:td opt; do
	case ${opt} in
		p )
			save_path=$OPTARG
			;;
		o )
			file_name=$OPTARG
			;;
		r )
			resolution=$(covert_resolution $OPTARG)
			;;
		t )
			save_path=$temp_dir
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

# Now $1 refers to the first non-option argument
echo "Remaining arguments: $@"

url="https://picsum.photos/$resolution

output_path="$file_path/$file_name.jpg"

echo "Downloading image to $filepath"

curl -o "$output_path" "$url"

echo "Image Downloaded Successfully"




