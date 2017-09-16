class AddAttachmentDocumentToChallenges < ActiveRecord::Migration
  def self.up
    change_table :challenges do |t|
      t.attachment :document
    end
  end

  def self.down
    remove_attachment :challenges, :document
  end
end
