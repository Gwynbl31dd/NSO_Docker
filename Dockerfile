# NSO Dockerized
FROM bitnami/minideb
# Modify this based on the NSO version of your binary installer
ARG NSO_VERSION=4.7.4.3

COPY nso-${NSO_VERSION}.linux.x86_64.installer.bin /tmp/nso

# Pre-requisite
RUN apt-get update && \
    apt-get install -y openssh-client openssh-client default-jre-headless python3 make ant && \
    sh /tmp/nso --system-install && \
    rm -f /etc/ncs/ssh/* && \
    ssh-keygen -m PEM -t rsa -f /etc/ncs/ssh/ssh_host_rsa_key -N '' && \
    ssh-keygen -t ed25519 -f /etc/ncs/ssh/ssh_host_ed25519_key -N '' && \
    echo '. /opt/ncs/current/ncsrc' >> /root/.bashrc && \
	rm -rf /tmp/* /var/tmp/* /var/lib/{apt,dpkg,cache,log}/ && \
	groupadd ncsadmin && \
	useradd admin -g ncsadmin && \
	echo 'admin:$6$xCnzTvhGBo5JwBnF$A7eeqpeUDeDzBLF0/..3QqGqtEaFYbDK2xsHrrQHm4RkQkX5W/AiCwwMx2osocS7qTv2a35zKTE3kS3oSKE2G.' | chpasswd -e && \
	rm -rf /usr/share/doc

COPY run-nso.sh /
COPY java.xml /var/opt/ncs/cdb/
COPY admin.xml /var/opt/ncs/cdb/
COPY ncs.conf /etc/ncs/ncs.conf

SHELL ["bash", "-c"]
RUN source /opt/ncs/current/ncsrc

VOLUME /var/opt/ncs/packages
VOLUME /var/opt/ncs

EXPOSE 8080 8888 830 2022 2023 2024 4569

CMD ["/run-nso.sh"]
