dist_folder=./dist
ts_compiler=./node_modules/typescript/bin/tsc
prettify_executable=./node_modules/prettier/bin/prettier.js
prettifyS_executable=./node_modules/prettier-standard/lib/index.js
ts_config_file=./tsconfig.json

compile:
	rm -rf ${dist_folder}
	${ts_compiler} -p ${ts_config_file}

prettify:
	${prettify_executable} \
	--no-semi \
	--single-quote \
	--trailing-comma "all" \
	--write "./src/**/*.ts"

prettifyS:
	${prettifyS_executable} \
	--trailing-comma "all" \
	"src/**/*.ts"
