#!/bin/bash
# chkconfig: 2345 98 02
#
# description: PM2 next gen process manager for Node.js
# processname: pm2
#
### BEGIN INIT INFO
# Provides:          pm2-{{heljs_name}}
# Required-Start: $local_fs $remote_fs
# Required-Stop: $local_fs $remote_fs
# Should-Start: $network
# Should-Stop: $network
# Default-Start:        2 3 4 5
# Default-Stop:         0 1 6
# Short-Description: PM2 init script
# Description: PM2 is the next gen process manager for Node.js
### END INIT INFO

NAME=pm2-{{heljs_name}}
PM2={{node_binary_path}}/../lib/node_modules/pm2/bin/pm2
USER={{heljs_user}}
DEFAULT=/etc/default/pm2-{{heljs_name}}

export PATH={{node_binary_path}}:$PATH
export PM2_HOME="/home/{{heljs_user}}/.pm2"

# The following variables can be overwritten in $DEFAULT

# maximum number of open files
MAX_OPEN_FILES=

# overwrite settings from default file
if [ -f "$DEFAULT" ]; then
	  . "$DEFAULT"
fi

# set maximum open files if set
if [ -n "$MAX_OPEN_FILES" ]; then
    ulimit -n $MAX_OPEN_FILES
fi

get_user_shell() {
    local shell=$(getent passwd ${1:-`whoami`} | cut -d: -f7 | sed -e 's/[[:space:]]*$//')

    if [[ $shell == *"/sbin/nologin" ]] || [[ $shell == "/bin/false" ]] || [[ -z "$shell" ]];
    then
      shell="/bin/bash"
    fi

    echo "$shell"
}

super() {
    local shell=$(get_user_shell $USER)
    su - $USER -s $shell -c "cd /home/{{heljs_user}}/{{heljs_name}}; PATH=$PATH; PM2_HOME=$PM2_HOME $*"
}

start() {
    echo "Starting $NAME"
    super $PM2 startOrRestart /home/{{heljs_user}}/service_state/app.json {{ heljs_pm2_params|default("") }}
}

stop() {
    super $PM2 delete all
    super $PM2 kill
}

restart() {
    echo "Restarting $NAME"
    stop
    start
}

reload() {
    echo "Reloading $NAME"
    super $PM2 reload all
}

status() {
    echo "Status for $NAME:"
    super $PM2 list
    RETVAL=$?
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    restart)
        restart
        ;;
    reload)
        reload
        ;;
    force-reload)
        reload
        ;;
    *)
        echo "Usage: {start|stop|status|restart|reload|force-reload}"
        exit 1
        ;;
esac
exit $RETVAL
