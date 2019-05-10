RSpec.describe IRD::Validator do
  it "has a version number" do
    expect(IRD::Validator::VERSION).not_to be nil
  end

	it "rejects IRD numbers that are too small" do
		expect(IRD::Validator.validate 533).to eq(false)
		expect(IRD::Validator.validate '09043042').to eq(false)
		expect(IRD::Validator.validate '00-000-000').to eq(false)
	end

	it "rejects invalid eight digit IRD numbers" do

	end

	it "rejects invalid nine digit IRD numbers" do
		expect(IRD::Validator.validate '100-000-000').to be(false)
	end

	it "accepts valid eight digit IRD numbers" do
		expect(IRD::Validator.validate '49-098-576').to be(false)
	end

	it "accepts valid nine digit IRD numbers" do
		expect(IRD::Validator.validate '136-410-132').to eq(true)
	end
end
