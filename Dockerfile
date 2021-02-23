# /usr/local/bin/start.sh will start the service

FROM gcr.io/distroless/static:nonroot 

ADD scripts/ /bin/

EXPOSE 8080

# Start processes
CMD /bin/start.sh
