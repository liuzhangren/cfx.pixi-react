pjName := cfx.pixi-react

docker:
	docker run \
		--name ${pjName} \
		--rm \
		-ti \
		-p 3080:80 \
		-p 3088:8080 \
		-p 3032:3000 \
		-p 3000:8000 \
		-v $$(pwd):/root/${pjName} \
		mooxe/node \
		/bin/bash

logs:
	docker logs -f ${pjName}

in:
	docker exec \
		-ti \
		${pjName} \
		/bin/bash

umibuild: build
	cp public/pages/document.html src/pages/document.ejs

umirebuild: rebuild
	cp public/pages/document.html src/pages/document.ejs

dev:
	umi dev

static:
	env COMPRESS=none umi build
	cp ./assets/favicon.ico ./dist/static
	cp -R ./assets ./dist/

export PATH := ./node_modules/.bin:$(PATH)

include ./node_modules/cfx.simple-build-tool/maker/main.mk