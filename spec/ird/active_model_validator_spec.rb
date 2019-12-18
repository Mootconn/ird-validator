class User
  include ::ActiveModel::Validations

  attr_accessor :ird_number

  validates :ird_number, ird: { message: 'has invalid format' }
end

RSpec.describe ActiveModel::Validations::IrdValidator do
  let(:model) { User.new }

  context 'validates IRD number in an ActiveModel class' do
    it 'calls IRD::Validator.validate' do
      model.ird_number = 59_091_850
      expect(IRD::Validator).to receive(:validate).and_call_original.once
      model.valid?
      expect(model.errors.full_messages).to eq ['Ird number has invalid format']
    end
  end
end
