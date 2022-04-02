uid = $(shell id -u)

.PHONY: build
build:
	docker run -it --rm -w /app -v `pwd`:/app -u $(uid):$(uid) -e JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 sgrio/ant ant

.PHONY: debug
debug:
	docker run -it --rm -w /app -v `pwd`:/app java:8 jar tf dist/realm.jar

.PHONY: test
test:
	docker run -it --rm -w /app -v `pwd`:/app java:8 java -jar -Xmx1024m -Xms1024m dist/realm.jar