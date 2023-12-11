require 'rails_helper'

RSpec.describe Item, type: :model do
  describe 'soft delete' do
    let(:item) { Item.create(name: 'Test Item') }

    it 'soft deletes an item' do
      item.soft_delete
      expect(item.deleted_at).not_to eq(nil)
    end

    it 'restores a soft deleted item' do
      item.soft_delete
      item.restore
      expect(item.deleted_at).to eq(nil)
    end

    it 'excludes soft deleted items from default scope' do
      item.soft_delete
      expect(Item.count).to eq(0)
    end
  end
end
