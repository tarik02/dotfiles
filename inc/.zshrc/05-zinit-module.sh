if [ -f "$DFI_THIRDPARTY/zinit/bin/zmodules/Src/zdharma/zplugin.so" ]; then
	module_path+=( "$DFI_THIRDPARTY/zinit/bin/zmodules/Src" )
	zmodload zdharma/zplugin
fi
