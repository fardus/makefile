# makefile
collection of makfile
````
 GIT
 DOCKER
 PHP
 SYMFONY
````

## Install
````
composer require  fardus/makefile
````

create a file ``Makefile`` on your current project

include it this different ``*.makefile``

````bash
include vendor/fardus/makefile/src/docker.makefile
include vendor/fardus/makefile/src/php.makefile
include vendor/fardus/makefile/src/symfony-bin.makefile
include vendor/fardus/makefile/src/symfony.makefile
include vendor/fardus/makefile/src/php-test.makefile
include vendor/fardus/makefile/src/php-analyze.makefile
include vendor/fardus/makefile/src/git.makefile
````
