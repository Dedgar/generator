# /usr/local/bin/start.sh will start the service

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

ADD scripts/ /usr/local/bin/

EXPOSE 8080

# Start processes
CMD /usr/local/bin/start.sh
