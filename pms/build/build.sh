cd /Users/aaron/rd/project/zentao/php/work/zentaopms
git fetch --all && git reset --hard origin/master && git pull
sed  -i '' 144,147d Makefile
make
