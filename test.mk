catalog-api-artisan:
	${docker_compose_catalog_api} exec api php artisan $(cmd)

marking-artisan:
	${docker_compose_marking} exec api php artisan $(cmd)

marking-artisan-companyseeder:
	${docker_compose_marking} exec api php artisan db:seed --class=CompanySeeder
	
catalog-api-test:
	${docker_compose_catalog_api} exec api sh -c "php artisan config:clear"
	${docker_compose_catalog_api} exec api sh -c "DB_HOST=test_db DB_DATABASE=test DB_USERNAME=test DB_PASSWORD=test php artisan test --env=testing --parallel"

marking-test:
	${docker_compose_marking} exec api sh -c "php artisan config:clear"
	${docker_compose_marking} exec api sh -c "APP_ENV=testing DB_HOST=test_db DB_DATABASE=test DB_USERNAME=test DB_PASSWORD=test php artisan test --env=testing --parallel" #--coverage

traefik-recreate:
	${docker_compose_traefik} down -v
	make docker-compose-up-traefik
