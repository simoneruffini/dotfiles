#! /bin/sh
# Simone Ruffini
# Fix the permissions on the parameters given to the script 
# if one of the parameters is a directory than fix all contents
# if a file fix only for that

PERMISSION_BKP_FILE_PATH="./permissions_bkp.txt"
SANE_FILE_PERMISSIONS="u=rw,g=r,o=r"
SANE_DIRECTORY_PERMISSIONS="u=rwx,g=r-x,o=r-x"

script_call_string="$0 $@"

# brief: fix permission of either a file or a folder/directory (not recursively)
# $1 valid path where to fix permissions
fix_from_item(){
    if [ -f "$1" ]; then
        # for files
        # user(u) = read + write
        # group(g) = read
        # global(o) = read
        # -rw-r--r-- or 644
        mode=$SANE_FILE_PERMISSIONS
    elif [ -d "$1" ]; then
        # for directories
        # user(u) = read + write + execute(open)
        # group(g) = read + write
        # global(o) = read + write
        # drwxr-xr-x or 755 (d stands for directory)
        mode=$SANE_DIRECTORY_PERMISSIONS
    else
        echo "'$1' is neither a valid directory or file"
        exit 1
    fi

    chmod "$mode" "$1"
}

# brief: print a file that contains the permissions of all files and directories
# before change
# $1 a valid path to a file or directory
# $2 a valid bkp_file_path
print_to_file_permissions_bkp(){

    echo "$(date)" > "$2" 
    echo "$script_call_string" >> "$2"
    echo "" >> "$2"

    # ls -d shows a directory as a "file" instead of its content
    # -exec + is used to be faster
    find "$1" -type f,d -exec ls -ld {} \+ >> "$2"
}

usage(){
    echo "Usage: $(basename "$0") { PATH [BKP_PATH] | -nbkp | -h | --help}"
    echo " where PATH is a valid path to a file or directory"
    echo " optional BKP_PATH is the path where the backup file will be saved, by"
    echo " default to $PERMISSION_BKP_FILE_PATH"
    echo " -nbkp      perform change without generating a backup file"
    echo " -h, --help help info"
}
help(){
    usage
    echo
    echo "This script sets sane permissions to either a file (PATH is a file path)"
    echo "or recursively to a root directory (PATH is a directory path) and its"
    echo "subdirectories/files"
    echo "The sane permissions for files are: $SANE_FILE_PERMISSIONS"
    echo "The sane permissions for directories are: $SANE_DIRECTORY_PERMISSIONS"
    echo "Check chmod(1) for details on permissions"
    echo 
    echo "When this script is executed a backup file containing previous"
    echo "permissions will be written to $PERMISSION_BKP_FILE_PATH therefore check"
    echo "where you execute the script."
    echo "Optionaly the backup file generation can be disabled via the -nbkp flag"
}

# if no parameter is given
[ -z "$1" ] && usage && exit 0

# if first parameter is help, show info
[ "$1" = "-h" ] || [ "$1" = "--help" ] && help && exit 0

# otherwise it must be a valid path otherwise exit
[ ! -e "$1" ] && echo "$1 No such path or directory" && exit 1

WORKING_PATH="$1"

# now check for either a string for BKP_PATH or the -nbkp option
if [ ! -z "$2" ]; then

    # if no backup option is specified
    if [ "$2" = "-nbkp" ]; then
        PERMISSION_BKP_FILE_PATH="/dev/null"
    else
        # check if path is valid by trying to create a file
        if $(touch --no-create "$2" >/dev/null 2>&1) ; then
            # path can be writte to: update default location of file
            PERMISSION_BKP_FILE_PATH="$2"
        else
            echo "$2 No such file or directory"
            exit 1
        fi
    fi
fi

yes_or_no() {
    while true; do
        read -p "$* [y/n]: " yn
        case $yn in
            [Yy]*) return 0 ;;  
            [Nn]*) return 1 ;;
        esac
    done
}

# if file already exists exit ask what to do
if [ -f "$PERMISSION_BKP_FILE_PATH" ]; then
    echo  "File '$PERMISSION_BKP_FILE_PATH' already exists and will be overwritten."
    yes_or_no "Continue"
    [ $? != 0 ] && exit 0
fi

# write backup file
print_to_file_permissions_bkp "$WORKING_PATH" "$PERMISSION_BKP_FILE_PATH"

# if $WORKING_PATH is a file this will run once otherwise will run for each directory
# or file found in $WORKING_PATH
find "$WORKING_PATH" -type f,d -print0 | while read -d $'\0' file
do
    fix_from_item "$file"
done
# why this convoluted way of calling this?
# https://stackoverflow.com/questions/9612090/how-to-loop-through-file-names-returned-by-find
 


