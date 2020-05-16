bin-install: ## Download and install the binary in the project (file is ignored)
	curl -sS https://get.symfony.com/cli/installer | bash
	mv ~/.symfony/bin/symfony .

cert-install: symfony ## Install the local HTTPS certificates
	$(SYMFONY_BIN) server:ca:install

serve: symfony ## Serve the application with HTTPS support
	$(SYMFONY_BIN) serve --daemon --port=$(PORT)

unserve: symfony ## Stop the web server
	$(SYMFONY_BIN) server:stop

serve-log: symfony ## Stop the web server
	$(SYMFONY_BIN) server:log
