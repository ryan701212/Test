FROM nvcr.io/nvidia/pytorch:24.12-py3
LABEL maintainer="ryan" version="1.0" description="ryan image"
USER root
RUN apt-get update
RUN apt-get install -y openssh-server vim && mkdir -p /run/sshd
RUN echo 'root:!QAZ@WSX3edc' | chpasswd
RUN echo "Port 22" >> /etc/ssh/sshd_config
RUN echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config
RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd", "-D"]
