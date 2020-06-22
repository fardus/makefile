bin-install: ## Download and install the binary in the project (file is ignored)
	test -f ./symfony || ( curl -sS https://get.symfony.com/cli/installer | bash &&	mv ~/.symfony/bin/symfony . )

cert-install: bin-install symfony ## Install the local HTTPS certificates
	$(SYMFONY_BIN) server:ca:install

serve: bin-install ## Serve the application with HTTPS support
	$(SYMFONY_BIN) serve --daemon --port=$(PORT)

unserve: bin-install ## Stop the web server
	$(SYMFONY_BIN) server:stop

serve-log: bin-install ## Stop the web server
	$(SYMFONY_BIN) server:log
