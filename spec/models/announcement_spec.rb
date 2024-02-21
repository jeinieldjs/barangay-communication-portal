require 'rails_helper'

RSpec.describe Announcement, type: :model do
    # pending "add some examples to (or delete) #{__FILE__}"
    describe 'validations' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:content) }
    end
  
    describe 'associations' do
      it { should belong_to(:user) }
    end
end
