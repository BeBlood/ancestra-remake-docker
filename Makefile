stack_name = ancestra
mysql_container_id = $(shell docker ps --filter name="$(stack_name)_mysql" -q)

start:
	docker stack deploy -c docker-compose.yml $(stack_name)

stop:
	docker stack rm $(stack_name)

build-images:
	docker build -t ancestra/realm:latest -f .docker/realm/Dockerfile .docker/realm
	docker build -t ancestra/game:latest -f .docker/game/Dockerfile .docker/game

import-database:
	# Remove database
	docker exec -it $(mysql_container_id) mysql -h mysql -u root -ptoor -e "DROP DATABASE ancestra_realm"
	docker exec -it $(mysql_container_id) mysql -h mysql -u root -ptoor -e "DROP DATABASE ancestra_game"
	# Init databases
	docker exec -it $(mysql_container_id) mysql -h mysql -u root -ptoor -e "CREATE DATABASE ancestra_realm"
	docker exec -it $(mysql_container_id) mysql -h mysql -u root -ptoor -e "CREATE DATABASE ancestra_game"
	# Import realms
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_realm < /ancestra/ancestra_realm.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_realm < /ancestra/servers/game/game.sql"
	# Import game
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/ancestra_game.sql"
	# Import revs dumps for ancestra_realm
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_realm < /ancestra/revs/ancestra_realm_rev1.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_realm < /ancestra/revs/ancestra_realm_rev2.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_realm < /ancestra/revs/ancestra_realm_rev3.sql"
	# Import revs dumps for game
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev2.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev3.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev4.sql"
	# docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev5.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev6.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev7.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev8.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev9.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev10.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev11.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev12.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev13.sql"
	docker exec -it $(mysql_container_id) bash -c "mysql -h mysql -u root -ptoor ancestra_game < /ancestra/revs/ancestra_game_rev14.sql"
