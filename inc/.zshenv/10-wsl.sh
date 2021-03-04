if [ ! -z $WSL_DISTRO_NAME ]; then
	export IS_WSL=1
else
	export IS_WSL=0
fi

if [[ $IS_WSL == 1 ]]; then
	export WSL_HOST_IP=$(ip ro list default | head -n1 | awk '{print $3}')
	export DISPLAY="$WSL_HOST_IP:0.0"
	export LIBGL_ALWAYS_INDIRECT=1

	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8
	export LANGUAGE=en_US.UTF-8
fi
