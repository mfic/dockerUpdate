#!/bin/bash

DC=$1
STAT=$2

case $DC in
	all)
		case $STAT in
			up)
				docker-compose -f watchtower.yml up -d
				docker-compose -f docker-gc.yml up -d
				;;
			down)
				docker-compose -f watchtower.yml down
				docker-compose -f docker-gc.yml down
				;;
			restart)
				docker-compose -f watchtower.yml restart
				docker-compose -f docker-gc.yml restart
				;;
			*)
				echo $"Usage: $0 {start|stop|restart}"
				exit 1
				;;
		esac ;;
	watchtower)
		case $STAT in
			up)
				docker-compose -f watchtower.yml up -d
				;;
			down)
				docker-compose -f watchtower.yml down
				;;
			restart)
				docker-compose -f watchtower.yml restart
				;;
			*)
				echo $"Usage: $0 {start|stop|restart}"
				exit 1
				;;
		esac ;;
	docker-gc)
		case $STAT in
			up)
				docker-compose -f docker-gc.yml up -d
				;;
			down)
				docker-compose -f docker-gc.yml down
				;;
			restart)
				docker-compose -f docker-gc.yml restart
				;;
			*)
				echo $"Usage: $0 {start|stop|restart}"
				exit 1
				;;
		esac ;;
esac
