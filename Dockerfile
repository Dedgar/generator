# /usr/local/bin/start.sh will start the service

FROM gcr.io/distroless/static:nonroot 

ADD scripts/ /bin/

EXPOSE 3333

# Start processes
CMD /usr/local/bin/start.sh
