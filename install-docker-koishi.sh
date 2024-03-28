#!/bin/bash
base_data_dir=$1
echo "path is ${base_data_dir}"
container_name=koishi
port=5140
image=koishijs/koishi:latest
docker pull $image

docker stop ${container_name}
docker rm ${container_name}
docker run --name=${container_name} \
        -d -it --restart=always \
        -p ${port}:${port} \
        -e PUID=`id -u` -e PGID=`id -g` \
        -e TZ="Asia/Shanghai" \
        -e LANG="zh_CN.UTF-8" \
        -v ${base_data_dir}/${container_name}/:/koishi \
${image}
