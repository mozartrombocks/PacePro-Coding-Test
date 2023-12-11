# app/models/item.rb

class Item < ApplicationRecord
  # Add deleted_at datetime attribute
  
  # Default scope to exclude deleted items
  default_scope { where(deleted_at: nil) }

  # Soft delete - set deleted_at 
  def soft_delete
    update_column(:deleted_at, Time.current) 
  end

  # Restore - set deleted_at to nil
  def restore
    update_column(:deleted_at, nil)
  end
end
