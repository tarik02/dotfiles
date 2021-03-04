function start {
	(nohup $@ </dev/null >/dev/null 2>&1 &) >/dev/null 2>&1
}
