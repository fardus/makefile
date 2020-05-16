GIT			 = git
GIT_AUTHOR = COil

gup: gstash gpull gpop ## stash project, pull rebase and stash pop

gpull: ## pull with rebase
	$(GIT) pull --rebase

gpoat: ## push all branch and tags
	$(GIT) push origin --all && git push origin --tags

gstash: ## stash project
	$(GIT) stash

gpop: ## unstash project
	$(GIT) stash pop

stats: ## Commits by hour for the main author of this project
	$(GIT) log --author="$(GIT_AUTHOR)" --date=iso | perl -nalE 'if (/^Date:\s+[\d-]{10}\s(\d{2})/) { say $$1+0 }' | sort | uniq -c|perl -MList::Util=max -nalE '$$h{$$F[1]} = $$F[0]; }{ $$m = max values %h; foreach (0..23) { $$h{$$_} = 0 if not exists $$h{$$_} } foreach (sort {$$a <=> $$b } keys %h) { say sprintf "%02d - %4d %s", $$_, $$h{$$_}, "*"x ($$h{$$_} / $$m * 50); }'
