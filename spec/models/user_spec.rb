require 'rails_helper'

RSpec.describe User, type: :model do
 # pending "add some examples to (or delete) #{__FILE__}"

 describe 'validations' do
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:complete_address) }
  it { should validate_presence_of(:province) }
  it { should validate_presence_of(:city_municipality) }
  it { should validate_presence_of(:barangay) }
  it { should validate_presence_of(:role) }
  it { should validate_presence_of(:contact_number)}
  it { should validate_numericality_of(:contact_number).only_integer }
  it { should validate_length_of(:contact_number).is_equal_to(11) }
end

end
