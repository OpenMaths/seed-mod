directoryPath="../mod-*"

for dir in `find $directoryPath -type d -maxdepth 0 -mindepth 0`; do
  cd $dir

  if [ -z "$(git status --porcelain)" ]; then
    echo "\nCHECKING OUT MASTER in ${dir}...\n"
    git checkout master

    echo "\nFETCHING LATEST FROM REMOTE in ${dir}...\n"
    git fetch origin --prune
    git pull origin master
  else
    echo "\nSKIPPING; THERE ARE UNCOMMITED CHANGES in ${dir}...\n"
  fi
done
