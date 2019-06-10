class AddUuidToPublishers < ActiveRecord::Migration[6.0]
  def change
    add_column :publishers, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
