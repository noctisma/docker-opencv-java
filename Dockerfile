FROM centos:7.4.1708

MAINTAINER noasking

# 必要なパッケージインストール
################################################################################
RUN yum update -y \
        && yum install -y git gcc gcc-c++ autoconf automake cmake \
                          freetype-devel libtool make mercurial nasm \
                          pkgconfig zlib-devel \
                          bzip2-devel hostname \
                          openssl \
                          openssl-devel \
                          wget \
                          which \
                          boost* \
                          ant \
        && yum clean all

# Java 安装
ADD jdk-8u131-linux-x64.tar.gz /

# 配置环境变量
ENV JAVA_HOME /jdk1.8.0_131
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

# OpenCV 配置
################################################################################
COPY opencv-3.4.0.tar.gz /

RUN cd \
    && mkdir opencv && tar xvzf /opencv-3.4.0.tar.gz -C opencv --strip-components 1 \
    && cd opencv \
    && mkdir build \
    && cd build \
    && cmake -D CMAKE_BUILD_TYPE=RELEASE -D CMAKE_INSTALL_PREFIX=/opencv/release -D BUILD_TESTS=OFF ..\
    && make -j8 \
    && make install \
    && cp /opencv/release/share/OpenCV/java/libopencv_java340.so /usr/local/lib/ \
    && cd \
    && rm -f /opencv-3.4.0.tar.gz

# Boostのパス設定
ENV BOOST_ROOT /usr/lib64/
ENV Boost_INCLUDE_DIR /usr/include/boost/
# LD_LIBRARY_PATH設定
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

# WORK_DIRECTORY設定
WORKDIR /app

# CMD設定(BASH)
CMD ["/bin/bash"]