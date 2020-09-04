FROM centos:7

RUN yum install -y epel-release; yum -y install ansible wget vim git tig python3; yum clean all
RUN echo 'root:docker' | chpasswd

COPY ansible.cfg /etc/ansible/ansible.cfg
COPY hosts /etc/ansible/hosts
COPY src /src
COPY id_rsa /src/id_rsa

RUN find /src -type f -exec chmod 0644 {} \;
RUN find /src -type d -exec chmod 0755 {} \;
RUN chmod 0400 /src/id_rsa
