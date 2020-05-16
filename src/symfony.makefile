symfony: $(SYMFONY_BIN)

sf: ## List all Symfony commands
	$(SYMFONY)

cc: ## Clear the cache. DID YOU CLEAR YOUR CACHE????
	$(SYMFONY) c:c

warmup: ## Warmump the cache
	$(SYMFONY) cache:warmup

fix-perms: ## Fix permissions of all var files
	chmod -R 777 var/*

assets: ## Install the assets with symlinks in the public folder
	$(SYMFONY) assets:install public/ --symlink --relative

rm-var: ## Purge cache and logs
	rm -rf var/cache/* var/logs/*

purge: rm-var cc warmup assets fix-perms ## Purge symfony project (assets, permissions, wramup)

commands: ## Display all commands in the project namespace
	$(SYMFONY) list $(PROJECT)

routes: ## get routes of project
	$(SYMFONY_BIN) console debug:router

translation: # update translation
	$(SYMFONY_BIN) console translation:update fr --force --output-format yaml

doctrine-validate: ## Check validate schema
	$(SYMFONY_BIN) console doctrine:schema:validate

migration: ## Make migration command
	$(SYMFONY_BIN) console make:migration

doctrine-migrate: ##  Migrate with doctrine migration
	$(SYMFONY_BIN) console doctrine:migrations:migrate -n

load-fixtures: ## Build the db, control the schema validity, load fixtures and check the migration status
	$(SYMFONY) doctrine:fixtures:load -n

load-database: ## Build the db, control the schema validity, load fixtures and check the migration status
	$(SYMFONY) doctrine:cache:clear-metadata
	$(SYMFONY) doctrine:database:create --if-not-exists
	$(SYMFONY) doctrine:schema:drop --force
	$(SYMFONY) doctrine:schema:create
	$(SYMFONY) doctrine:schema:validate
	$(SYMFONY) doctrine:fixtures:load -n
	$(SYMFONY) doctrine:schema:validate

init-snippet: ## Initialize a new snippet
	$(SYMFONY) $(PROJECT):init-snippet
