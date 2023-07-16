#!/usr/bin/env sh

# Write the docker-compose alias to ~/.bashrc
echo 'alias docker-compose="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v "$PWD:$PWD" -w="$PWD" docker/compose"' >> ~/.bashrc

# Include ~/.bashrc in ~/.bash_profile
echo 'if [ -f ~/.bashrc ]; then . ~/.bashrc; fi' >> ~/.bash_profile

. ~/.bash_profile
