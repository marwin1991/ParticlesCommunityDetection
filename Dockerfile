FROM centos/devtoolset-6-toolchain-centos7

WORKDIR /particles

USER 0
RUN yum install -y --setopt=tsflags=nodocs wget && yum clean all -y
RUN yum install -y --setopt=tsflags=nodocs unzip && yum clean all -y

RUN wget https://snap.stanford.edu/releases/Snap-2.4.zip
RUN unzip Snap-2.4.zip -d snap
RUN rm -f Snap-2.4.zip

WORKDIR /particles/snap
RUN mv /particles/snap/Snap-2.4/** /particles/snap
RUN rm -f -r /particles/snap/Snap-2.4

WORKDIR /particles/snap/examples


RUN wget https://github.com/quiles/ParticleCommunity/archive/master.zip
RUN unzip master.zip -d particle
RUN rm -f master.zip
RUN ls -al /particles/snap/examples/particle
RUN mv /particles/snap/examples/particle/ParticleCommunity-master/** /particles/snap/examples/particle
RUN rm -f -r /particles/snap/examples/particle/ParticleCommunity-master

WORKDIR /particles/snap/examples/particle
RUN yum install -y --setopt=tsflags=nodocs make && yum clean all -y
RUN make

ENTRYPOINT [ "/bin/bash","-c","tail -f /dev/null" ]