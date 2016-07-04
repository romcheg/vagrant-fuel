#! /bin/bash

apt-get update
DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

DEBIAN_FRONTEND=noninteractive apt-get install -y python-dev\
                                                  python3-dev\
                                                  libpq-dev\
                                                  python-pip\
                                                  build-essential\
                                                  postgresql-9.4\
                                                  vim \
                                                  vim-nox\
                                                  curl\
                                                  git-core\
                                                  zsh\
                                                  exuberant-ctags\
                                                  libffi-dev

pip install --upgrade pip setuptools ipython tox virtualenvwrapper
echo 'source /usr/local/bin/virtualenvwrapper_lazy.sh' >> .bashrc

chsh -s `which zsh` vagrant
curl -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sed -e '83,96d' | sudo -u vagrant bash

sudo -u vagrant git config --global core.excludesfile ~/.config/git/ignore

sudo -u postgres psql << EOF
     CREATE ROLE nailgun WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'nailgun';
     CREATE ROLE openstack_citest WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'insecure_slave';
     CREATE DATABASE NAILGUN WITH OWNER = nailgun;
EOF

echo 'host    all             nailgun             0.0.0.0/0               md5' >> /etc/postgresql/9.4/main/pg_hba.conf
systemctl restart postgresql.service
