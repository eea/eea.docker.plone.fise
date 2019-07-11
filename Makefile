.DEFAULT: bootstrap

.PHONY: bootstrap
bootstrap: init setup-data setup-plone
	@echo "bootstraping"

.PHONY: init
init:
	git submodule init
	git submodule update

.PHONY: setup-data
setup-data:		## Setup the datastorage for Zeo
	mkdir -p data/filestorage
	mkdir -p data/zeoserver
	@echo "Setting data permission to uid 500"
	sudo chown -R 500 data

.PHONY: setup-plone
setup-plone:		## Setup products folder and Plone user
	docker-compose up -d
	docker-compose exec plone bin/develop rb
	docker-compose exec plone bin/zeo_client adduser admin admin

.PHONY: start-plone
start-plone:		## Start the plone process
	docker-compose up -d
	docker-compose exec plone bin/zeo_client fg

.PHONY: start-frontend
start-frontend:		## Start the frontend with Hot Module Reloading
	docker-compose up -d
	docker-compose exec frontend npm run start

.PHONY: help
help:		## Show this help.
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

