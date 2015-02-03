export EDITOR="vim"
export LC_CTYPE=en_US.UTF-8
export NODE_PATH=/usr/local/lib/node_modules
export SCALA_HOME=/usr/local/scala
export GOPATH=/Users/Shared/Development/Go
export PATH=$PATH:/usr/local/go/bin
export XCODE="`xcode-select --print-path`"
export PATH="/usr/local/bin:$HOME/bin:/usr/local/sbin:/usr/local/mysql/bin:${SCALA_HOME}/bin:$PATH"
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# uncomment when using AVR
#export C_INCLUDE_PATH=/usr/local/CrossPack-AVR/include:$C_INCLUDE_PATH

export DOCKER_CERT_PATH=/Users/dylan/.boot2docker/certs/boot2docker-vm
export DOCKER_TLS_VERIFY=1
export DOCKER_HOST=tcp://192.168.59.103:2376

if [[ -f .api_secrets.yml ]]; then

  export AWS_ACCESS_KEY_ID=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['aws_access_key_id']"`
  export AWS_SECRET_ACCESS_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['default']['aws_secret_access_key']"`
  export OJP_AWS_ACCESS_KEY_ID=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['ojp']['aws_access_key_id']"`
  export OJP_AWS_SECRET_ACCESS_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.api_secrets.yml'))['ojp']['aws_secret_access_key']"`

fi

if [[ -f .app_secrets.yml ]]; then

  export RHIZOME_POSTMARK=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['rhizome']['defaults']['postmark']"`

  export OAUTH_RAILS_FB_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['facebook_key']"`
  export OAUTH_RAILS_FB_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['facebook_secret']"`
  export OAUTH_RAILS_TW_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['twitter_key']"`
  export OAUTH_RAILS_TW_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['twitter_secret']"`
  export OAUTH_RAILS_LI_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['linkedin_key']"`
  export OAUTH_RAILS_LI_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['linkedin_secret']"`
  export OAUTH_RAILS_GH_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['github_key']"`
  export OAUTH_RAILS_GH_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['github_secret']"`
  export OAUTH_RAILS_DB_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['dropbox_key']"`
  export OAUTH_RAILS_DB_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['oauth_rails']['defaults']['dropbox_secret']"`

  export POWDERBIRD_POSTMARK=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['powderbird']['defaults']['postmark']"`
  export POWDERBIRD_FB_KEY=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['powderbird']['defaults']['facebook_key']"`
  export POWDERBIRD_FB_SECRET=`ruby -ryaml -e "puts YAML::load_file(File.join(File.expand_path('~'), '.app_secrets.yml'))['powderbird']['defaults']['facebook_secret']"`

fi

# python related
if [ -n "$VIRTUAL_ENV" ]; then
  . "$VIRTUAL_ENV/bin/activate"
fi

export NVM_DIR="/Users/dylan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
