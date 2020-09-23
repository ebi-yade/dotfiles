apply:
	cp -r ~/$(file) ./home/$(file)

diff:
	diff ~/$(file) ./home/$(file)
