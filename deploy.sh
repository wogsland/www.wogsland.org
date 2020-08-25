# deploy under the sudo crontab on development
if [ "$#" -gt 0 -a "$1" = "Wogsland.org" ]
then
  cd /var/www/Wogsland.org/
  BRANCH="$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')"
  if [ "$BRANCH" = "master" ]
  then
    dt=$(date '+%Y%m%d%H%M%S');
    git branch $dt.backup
    git pull origin master
  fi
fi
