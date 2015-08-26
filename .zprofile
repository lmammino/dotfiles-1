export EDITOR="vim"
export LC_CTYPE=en_US.UTF-8
export NODE_PATH=/usr/local/lib/node_modules
export SCALA_HOME=/usr/local/scala
export GOPATH=/Users/Shared/Development/Go
export XCODE="`xcode-select --print-path`"
export PATH="/usr/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/mysql/bin:${SCALA_HOME}/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# uncomment when using AVR
#export C_INCLUDE_PATH=/usr/local/CrossPack-AVR/include:$C_INCLUDE_PATH

#export DOCKER_CERT_PATH=/Users/dylan/.boot2docker/certs/boot2docker-vm
#export DOCKER_TLS_VERIFY=1
#export DOCKER_HOST=tcp://192.168.59.103:2376
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/Users/dylan/.docker/machine/machines/b2d"
export DOCKER_MACHINE_NAME="b2d"

if [[ -f ~/.api_secrets.yml ]]; then

  export AWS_ACCESS_KEY_ID=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['aws_access_key_id']"`
  export AWS_SECRET_ACCESS_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['aws_secret_access_key']"`

fi

if [[ -f ~/.app_secrets.yml ]]; then

  export LC_STUMPTOWN_CONTENTFUL_SPACE_ID=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['stumptown']['defaults']['contentful']['space_id']"`
  export LC_STUMPTOWN_CONTENTFUL_PROD_TOKEN=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['stumptown']['defaults']['contentful']['production_api_access_token']"`
  export LC_STUMPTOWN_CONTENTFUL_PREVIEW_TOKEN=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['stumptown']['defaults']['contentful']['preview_api_access_token']"`
  export LC_STUMPTOWN_CONTENTFUL_MGMT_TOKEN=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['stumptown']['defaults']['contentful']['management_api_oauth_access_token']"`

  #export RHIZOME_POSTMARK=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['rhizome']['defaults']['postmark']"`
  #export RHIZOME_BUILDER_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['rhizome']['defaults']['builder_key']"`
  #export RHIZOME_DROPBOX_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['rhizome']['defaults']['dropbox_key']"`
  #export RHIZOME_DROPBOX_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['rhizome']['defaults']['dropbox_secret']"`
  #export RHIZOME_DROPBOX_TOKEN=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['rhizome']['defaults']['dropbox_token']"`

  #export OAUTH_RAILS_FB_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['facebook_key']"`
  #export OAUTH_RAILS_FB_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['facebook_secret']"`
  #export OAUTH_RAILS_TW_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['twitter_key']"`
  #export OAUTH_RAILS_TW_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['twitter_secret']"`
  #export OAUTH_RAILS_LI_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['linkedin_key']"`
  #export OAUTH_RAILS_LI_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['linkedin_secret']"`
  #export OAUTH_RAILS_GH_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['github_key']"`
  #export OAUTH_RAILS_GH_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['github_secret']"`
  #export OAUTH_RAILS_DB_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['dropbox_key']"`
  #export OAUTH_RAILS_DB_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['dropbox_secret']"`

  #export POWDERBIRD_POSTMARK=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['powderbird']['defaults']['postmark']"`
  #export POWDERBIRD_FB_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['powderbird']['defaults']['facebook_key']"`
  #export POWDERBIRD_FB_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['powderbird']['defaults']['facebook_secret']"`

fi

# python related
if [ -n "$VIRTUAL_ENV" ]; then
  . "$VIRTUAL_ENV/bin/activate"
fi

#export NVM_DIR="{$HOME}/.nvm"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
