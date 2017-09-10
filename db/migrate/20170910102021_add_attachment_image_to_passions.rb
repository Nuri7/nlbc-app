class AddAttachmentImageToPassions < ActiveRecord::Migration
  def self.up
    change_table :passions do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :passions, :image
  end
end
