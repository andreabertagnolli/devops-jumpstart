node {
  stage name: "Commit"

  def WORKSPACE = pwd();

  sh "cp -af /vagrant/. \"${WORKSPACE}/\""
  sh "bundle install --path ~/.gem"
  sh "bundle exec rake db:migrate"

  sh "bundle exec rake spec"

  stage name: "Acceptance", concurrency: 1

  sh "cp -af /vagrant/. \"${WORKSPACE}/\""

  sh "cap testing deploy"

  sh "bundle install"
  sh "bundle exec rake features BLOG_HOST=http://testing"

  stage name: "Production", concurrency: 1

  sh "cp -af /vagrant/. \"${WORKSPACE}/\""
  sh "cap production deploy"
}
