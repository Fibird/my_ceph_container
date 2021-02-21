FROM centos:centos7

RUN yum install -y epel-release && \
    yum install -y python-pip leveldb leveldb-devel make \
	systemd lvm2 git fuse fuse-devel libibverbs gcc && \
	yum install -y http://mirrors.163.com/ceph/rpm-luminous/el7/noarch/ceph-deploy-2.0.1-0.noarch.rpm && \
	pip install --upgrade 'pip<21.0.0' && \
	pip install prettytable

WORKDIR /data

ADD ceph-rpm/12.1.0/ /data
RUN rpm -ivh --nodeps *.rpm && \
	rm -rf *.rpm
