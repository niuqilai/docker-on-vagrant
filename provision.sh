mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup`date '+%Y%m%d_%H%M%S'` 
curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
yum clean all
yum makecache
yum update

yum install -y yum-utils device-mapper-persistent-data lvm2

yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

yum list docker-ce --showduplicates | sort -r |tee -a /tmp/docker_on_yum.log
yum install -y docker-ce 
docker -v

systemctl start docker
systemctl enable docker
systemctl status docker

docker pull hello-world
docker run hello-world

echo "finish docker server build "
