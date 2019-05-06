class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :uuid
      t.string :request_url

      t.timestamps
    end
  end
end
