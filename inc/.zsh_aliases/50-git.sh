function merge-to {
	target_branch="$1"
	shift

	branch_name=$(git symbolic-ref -q HEAD)
	branch_name=${branch_name##refs/heads/}
	branch_name=${branch_name:-HEAD}

	git checkout $target_branch && git merge $branch_name && git push && git checkout $branch_name
}

function hide-static {
	[[ -d .git ]] || return 1

	show-static

	echo '/static/' >> .git/info/exclude
	echo '/var/control/' >> .git/info/exclude

	return 0
}

function show-static {
	[[ -d .git ]] || return 1

	cp .git/info/exclude .git/info/exclude.bak
	cat .git/info/exclude.bak \
		| sed '/^\/static\/$/d' \
		| sed '/^\/var\/control\/$/d' \
		> .git/info/exclude
	rm .git/info/exclude.bak
}

function commit-static {
	[[ -d .git ]] || return 1

	message="${1:-build assets}"

	show-static

	git add static var
	git commit -m "$message"

	hide-static

	return 0
}
