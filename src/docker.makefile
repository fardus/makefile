DOCKER	 = docker-compose

ps: docker-compose.yaml ## show current processes
	$(DOCKER) -f docker-compose.yaml ps

up: docker-compose.yaml ## Start the docker hub (MySQL,redis,adminer,elasticsearch,head,Kibana)
	$(DOCKER) -f docker-compose.yaml up -d

down: docker-compose.yaml ## Stop the docker hub
	$(DOCKER) down --remove-orphans
