.PHONY: apply
apply:
	cp -r ~/$(file) ./home/$(file)

.PHONY: diff
diff:
	diff ~/$(file) ./home/$(file)
