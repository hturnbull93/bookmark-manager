require 'database_connection'
require 'pg'

describe DatabaseConnection do
  describe '#setup' do
    expect(PG).to receive(:connect).with(dbname: 'bookmark_manager_test')
    DatabaseConnection.setup('bookmark_manager_test')
  end
end
