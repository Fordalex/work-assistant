web: bin/rails server -p ${PORT:-5000} -e $RAILS_ENV
mysql.server restart
worker: bin/rails db:migrate
release: rake db:migrate
