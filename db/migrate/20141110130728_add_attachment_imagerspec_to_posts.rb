class AddAttachmentImagerspecToPosts < ActiveRecord::Migration
  def self.up
    change_table :posts do |t|
      t.attachment :imagerspec
    end
  end

  def self.down
    remove_attachment :posts, :imagerspec
  end
end
