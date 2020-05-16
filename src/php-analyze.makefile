analyze-install:
	$(COMPOSER) req --dev phpstan/phpstan
	$(COMPOSER) req --dev phpstan/phpstan-symfony phpstan/phpstan-doctrine phpstan/phpstan-deprecation-rules phpstan/phpstan-phpunit slam/phpstan-extensions thecodingmachine/phpstan-strict-rules
	$(COMPOSER) req --dev squizlabs/php_codesniffer
	$(COMPOSER) req --dev friendsofphp/php-cs-fixer
	$(COMPOSER) req --dev vimeo/psalm

cs: codesniffer stan ## Launch check style and static analysis

codesniffer: ## Run php_codesniffer only
	./vendor/squizlabs/php_codesniffer/bin/phpcs --standard=phpcs.xml -n -p src/

stan: ## Run PHPStan only
	./vendor/bin/phpstan analyse -l max --memory-limit 1G -c phpstan.neon src/

psalm: ## Run psalm only
	./vendor/bin/psalm --show-info=false

init-psalm: ## Init a new psalm config file for a given level, it must be decremented to have stricter rules
	[ -f ./psalm.xml ] && rm ./psalm.xml || echo 'no ./psalm.xml'
	./vendor/bin/psalm --init src/ 3

cs-fix: ## Run php-cs-fixer and fix the code.
	./vendor/bin/php-cs-fixer fix src/

sonar: sonar-project.properties ## sonar scan src directory
	sonar-scanner
