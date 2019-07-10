.DEFAULT: setup-data

setup-data:
	mkdir -p data/filestorage
	mkdir -p data/zeoserver
	@echo "Setting data permission to uid 500"
	sudo chown -R 500 data

setup-plone:
	docker-compose exec plone bin/develop rb
	docker-compose exec plone adduser admin admin

start-plone:
	docker-compose exec plone bin/zeo_client fg

start-frontend:
	docker-compose exec frontend npm run start
