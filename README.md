# docker-opencv-java

### 依赖

- Docker 17.05.0-ce
- Centos 7.4.1708
- Java 1.8.0_131
- OpenCV 3.4.0

### 安装步骤

##### 进入指定目录

```commandline
mkdir -p /usr/local/docker/docker-opencv-java

```

##### 下载JDK和OpenCV

```commandline
wget https://github.com/Itseez/opencv/archive/3.4.0.tar.gz
wget --no-cookies --no-check-certificate --header "Cookie:gpw_e24=http%3a%2f%2fwww.oracle.com%2ftechnetwork%2fjava%2fjavase%2fdownloads%2fjdk7-downloads-1880260.html;oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
```

##### 运行Dockerfile

```commandline
docker build -t="noasking/centos74-opencv340-java8" .
```

### 结合Spring Boot 使用



### 后续工作

- 删除不必要的依赖，降低镜像的大小

### 备注

目前仅测试了依赖的版本，其他版本不保证一定可行，请自行测试