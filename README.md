# Ancestra Remake on docker (TEST)

Just a test to host an ancestra remake server on docker.

## Prequisites

- Make
- Docker

## How to install

1 - Build docker images

```shell
$ make build-images
```

2 - Start the stack

```shell
$ make start
```

Default list of ports (you may want to redirect if you want to use DNS):

- Realm = 127.0.0.1:444
- Game = 127.0.0.1:5555
- Static (lang) = 127.0.0.1:8081
- Adminer = 127.0.0.1:9090

3 - Initialize databases

Update `./servers/game/game.sql` file:

```sql
`ServerIP` = 'YOUR SERVER IP',
```

Then start the import script (may take a few time)

```shell
$ make import-database
```

4 - Download client

From https://gitlab.com/bouh2pmg/Client-Dofus-1-29/-/tree/master/Client

5 - Update [config.xml](./servers/game/config.xml) file

```
<config>
	<delay value="500"/>
	<rdelay value="3000"/>
	<rcount value="10"/>

	<conf name="En ligne">
        <connserver ip="YOUR REALM SERVER IP OR HOST" name="TEST" port="444"/>
		<dataserver url="data/" type="local" priority="3" />
		<dataserver url="http://[YOUR STATIC SERVER IP OR HOST]/dofus/" priority="2" />
	</conf>

	<cacheasbitmap>
		<cache element="ExternalContainer/InteractionCell" value="false" />
		<cache element="ExternalContainer/Ground" value="false" />
		<cache element="ExternalContainer/Object1" value="false" />
		<cache element="ExternalContainer/Object2" value="false" />
		<cache element="ExternalContainer/Zone" value="false" />
		<cache element="ExternalContainer/Select" value="false" />
		<cache element="ExternalContainer/Grid" value="false" />
		<cache element="ExternalContainer/Pointer" value="false" />
		<cache element="GAPI/UI" value="false" />
		<cache element="GAPI/UITop" value="false" />
		<cache element="GAPI/Popup" value="false" />
		<cache element="GAPI/UIUltimate" value="false" />
		<cache element="GAPI/Cursor" value="false" />
		<cache element="mapHandler/BACKGROUND" value="false" />
		<cache element="mapHandler/Cell/Ground" value="false" />
		<cache element="mapHandler/Cell/Object1" value="false" />
		<cache element="mapHandler/Cell/Object2" value="false" />
		<cache element="mapHandler/Cell/ObjectExternal" value="false" />
		<cache element="Zone/Zone" value="true" />
		<cache element="Zone/Pointers" value="true" />
	</cacheasbitmap>
</config>
```

6 - Launch game & connect to the server

Login: admin
Password: admin

## How to add a new server

TODO

## Build jar files from source

#### Game

1 - Go to sources/Game

```shell
$ make build
```

2 - Debug & Test your jar file (optional)

```shell
$ make debug
$ make test
```

3 - Place the `dist/game.jar` under `.docker/game/` directory then build images

```shell
$ make build-images
```

You must restart your stack ou update your services in order to make it work

#### Realm

It seems that the source code is not working

1 - Go to sources/Realm

```shell
$ make build
```

2 - Debug & Test your jar file (optional)

```shell
$ make debug
$ make test
```

3 - Place the `dist/realm.jar` under `.docker/realm/` directory then build images

```shell
$ make build-images
```

You must restart your stack ou update your services in order to make it work