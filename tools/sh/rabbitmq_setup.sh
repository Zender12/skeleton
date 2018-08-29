#!/bin/bash

#setting up an internal QADB -> QADBv3 exchange and queue
rabbitmqadmin --host=192.168.27.40 -u root -p root --vhost=qadb declare exchange name=qadb3 type=fanout
rabbitmqadmin --host=192.168.27.40 -u root -p root --vhost=qadb declare queue name=qadbv3 durable=true
rabbitmqadmin --host=192.168.27.40 -u root -p root --vhost=qadb declare binding source=qadb3 destination_type=queue destination=qadbv3 routing_key=qadbv3

#setting up an external QADB exchange
rabbitmqadmin --host=192.168.27.40 -u root -p root --vhost=qadb3 declare exchange name=qadb3 type=fanout
