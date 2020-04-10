require './lib/database_connection'

# def persisted_data(table:, id:)
#   DatabaseConnection.query("SELECT * FROM #{table} WHERE id = '#{id}';")
# end

def persisted_data(id:)
  connection = PG.connect(dbname: 'bookmark_manager_test')
  result = connection.query("SELECT * FROM bookmarks WHERE id = #{id};")
  result.first
end
