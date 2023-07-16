#!/usr/bin/env sh

# Write the docker-compose alias to ~/.bashrc
echo 'alias docker-compose="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD:$PWD" -w="$PWD" docker/compose"' >> ~/.bashrc

. ~/.bash_profile
