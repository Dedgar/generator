# /usr/local/bin/start.sh will start the service

FROM registry.access.redhat.com/ubi8/ubi-minimal:latest

ADD scripts/ /bin/

EXPOSE 8080

# Start processes
CMD /bin/start.sh
