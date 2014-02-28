#!/bin/bash
CFG=${CFG:-}
REDIS_HOST=$REDIS_PORT_6379_TCP_ADDR
REDIS_PORT=$REDIS_PORT_6379_TCP_PORT

if [ "$CFG" != "" ]; then
    curl $CFG -o /etc/hipache.conf.json --no-check-certificate
else
    cat << EOF > /etc/hipache.conf.json
{
    "server": {
        "accessLog": "/var/log/hipache/access.log",
        "port": 80,
        "workers": 2,
        "maxSockets": 100,
        "deadBackendTTL": 30,
        "tcpTimeout": 30,
        "retryOnError": 3,
        "deadBackendOn500": true,
        "httpKeepAlive": false
    },
    "redisHost": "$REDIS_HOST",
    "redisPort": $REDIS_PORT
}
EOF
fi

/usr/bin/hipache -c /etc/hipache.conf.json
