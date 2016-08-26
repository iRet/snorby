# This code overwrites Mysql2Adapter's `database` method,
# which pulls back all tables with views.
#
# The new method returns only tables, without the views.
#
ActiveRecord::ConnectionAdapters::Mysql2Adapter.send(
  :include, Scenic::Adapters::Mysql::TablesDefinition
)

# Tell Scenic to use MySQL instead of the defaulted PostgreSQL.
Scenic.configure do |config|
  config.database = Scenic::Adapters::Mysql.new
end
