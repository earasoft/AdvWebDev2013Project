sudo add-apt-repository -y ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt-dev libgdbm-dev libncurses5-dev automake libtool bison libffi-dev curl nodejs
cd
curl -L https://get.rvm.io | bash -s stable
source ~/.profile
source ~/.rvm/scripts/rvm
rvm install 2.0.0
rvm use 2.0.0 --default
gem install rails --verbose --debug
git clone https://github.com/earasoft/AdvWebDev2013Project.git
cd AdvWebDev2013Project/project/config/
bundle install
cp application.example.yml application.yml
cp database.example.yml database.yml
rake db:migrate
rake db:seed
rails server
echo 'Based off http://gorails.com/setup/ubuntu'
ruby -v