# apache PHP certbot 

FROM centos:7
ENV container docker
#
# systemd stuff from: https://hub.docker.com/_/centos
#
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;


RUN yum -y install epel-release 

#COPY startup.sh /usr/local/bin/startup.sh
#COPY startup.service /etc/systemd/system/startup.service


#RUN systemctl enable startup.service


VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]

