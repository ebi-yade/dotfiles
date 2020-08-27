apply-local-change:
	ls ~/$(file)
	cp -r ~/$(file) ./home/$(file)
