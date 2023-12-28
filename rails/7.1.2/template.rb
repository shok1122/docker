# Usage: rails new myapp -m activegraph.rb

gem_group :development do
  gem 'neo4j-rake_tasks'
  gem 'neo4j'
  gem 'neo4j-core'
  gem 'activesupport'
  gem 'activegraph'
end

inject_into_file 'config/application.rb', before: '# Require the gems listed in Gemfile' do <<__END__
require 'active_graph/railtie'

__END__
end

gsub_file 'config/application.rb', "require 'rails'", ''

generator = %q[
    # Enable ActiveGraph generators, e.g:  rails generate model Admin --parent User
    config.generators do |g|
      g.orm :active_graph
      # g.test_framework  :rspec, :fixture => false
    end

]

environment generator
environment nil, env: 'development' do <<__END__
  config.neo4j.driver.url = '#{ENV['NEO4J_URL']}'
  config.neo4j.driver.auth_token = Neo4j::Driver::AuthTokens.basic('#{ENV['NEO4J_USER']}', '#{ENV['NEO4J_PASS']}')
  config.neo4j.driver.encryption = false
__END__
end
