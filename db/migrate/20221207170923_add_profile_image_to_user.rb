class AddProfileImageToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :usuarios, :profile_image, :string, :default => '01'
  end
end
