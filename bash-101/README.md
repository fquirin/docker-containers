# Bash Script 101

Useful stuff to use in Bash scripts.

## Argument Parsing

```
bool_arg=0
str_arg="default"
while getopts ys:h? opt; do
	case $opt in
		y) bool_arg=1;;
		s) str_arg="$OPTARG";;
		?|h) printf "Usage: %s [-y] [-s string]\n" $0; exit 2;;
	esac
done
if [ $bool_arg -eq 1 ]; then
	echo "boolean argument is TRUE"
else
	echo "boolean argument is FALSE"
fi
echo "String argument is: $str_arg"
```

## Script Path

`SCRIPT_FOLDER=$(dirname $(realpath $BASH_SOURCE))`


## User Input

```
read -p "Enter an option:: " option
echo "$option"
```


## Variable Defined

```
if [ -z "$1" ]; then
	echo "Argument 1 is: $1"
fi
```

```
if [ ! -z "$1" ]; then
	echo "Argument 1 is not defined"
fi
```


## Folder and Files

```
if [ -f "/path/to/file" ]; then
	echo "File exists"
fi
```

```
if [ -d "/path/to/folder" ]; then
	echo "Folder exists"
fi
```


## Time & Date

`echo $(date +'%Y_%m_%d_%H:%M:%S')`


## Functions

```
function log {
   echo "$(date +'%Y_%m_%d_%H:%M:%S') - Message: $1"
}

log "Hello World"
```
