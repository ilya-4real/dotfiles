#!/bin/sh

activate_pyenv() {
	local home_dir="/home/ilya"
	if [[ "$PWD" == "$home_dir" ]]; then 
		return 0
	fi

	local env_dirs=(".env" ".venv" "venv")
	for dir in $env_dirs; do
		if [[ -d $dir ]]; then
			echo "activating python environment in $dir"
			source $dir/bin/activate
			break
		fi
	done
}

