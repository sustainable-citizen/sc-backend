require 'rails_helper'

RSpec.describe Sample, type: :model do
  it { should validate_presence_of(:title) }
end
