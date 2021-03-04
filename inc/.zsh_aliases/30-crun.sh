function crun {
	if [ -f "$1" ]; then
		filename="$1"
		shift
	else
		filename=$(find . -maxdepth 1 -type f \( -iname \*.c -o -iname \*.cpp \) | head -1)
	fi
	extension="${filename##*.}"
	name="${filename%.*}"

	if [[ $extension == 'c' ]]; then
		clang -std=c11 -lm "$@" $filename -o "$name.out" && clear && "./$name.out"
	else
		clang++ -std=c++17 -lm "$@" $filename -o "$name.out" && clear && "./$name.out"
	fi
}
