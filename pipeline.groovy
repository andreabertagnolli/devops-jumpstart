node {
  stage "Commit"

  def WORKSPACE = pwd();

  sh "cp -af /vagrant/. \"${WORKSPACE}/\""
  sh "bundle install --path ~/.gem"
  sh "bundle exec rake db:migrate"

  sh "bundle exec rake spec"

  stage "Acceptance"

  sh "cp -af /vagrant/. \"${WORKSPACE}/\""

  sh "cap testing deploy"

  sh "bunlde install"
  sh "bundle exec rake features BLOG_HOST=http://testing"

  stage "Production"

  sh "cp -af /vagrant/. \"${WORKSPACE}/\""
  sh "cap production deploy"
}
