directoryPath="../mod-*"

for dir in `find $directoryPath -type d -maxdepth 0 -mindepth 0`; do
  echo "\nCOPYING COMMON FILES INTO ${dir}...\n"
  cp -v "codecov.yaml" "jest.json" "makefile" "renovate.json" "tsconfig.json" $dir
  cp -vr ".circleci" $dir

  cd $dir

  sleep 2
  echo "\nCOMPILING SOURCE IN ${dir}...\n"
  sleep 2

  make compile

  if [ -z "$(git status --porcelain)" ]; then
    sleep 2
    echo "\n${dir} UP TO DATE\n"
  else
    sleep 2
    echo "\nCOMMITTING CHANGES IN ${dir}...\n"
    sleep 2

    git add -A
    git commit -m "build(Config): Update to latest seed...\n"

    sleep 2
    echo "\nBUMPING VERSION (MINOR) IN ${dir}...\n"
    sleep 2

    npm version minor
    git push --follow-tags
  fi
done
