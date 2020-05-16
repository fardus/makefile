test: phpunit.xml* ## Launch main functionnal and unit tests
	./bin/phpunit --testsuite=main --stop-on-failure

test-external: phpunit.xml* ## Launch tests implying external resources (api, services...)
	./bin/phpunit --testsuite=external --stop-on-failure

test-all: phpunit.xml* ## Launch all tests
	./bin/phpunit --stop-on-failure
