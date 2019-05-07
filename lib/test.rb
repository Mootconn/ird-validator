require './validator.rb'
validate_zero = IRD::Validator.validate('00-000-000')
validate_eight = IRD::Validator.validate('49-098-576')
validate_nine = IRD::Validator.validate('136-410-132')
validate_invalid_nine = IRD::Validator.validate('100-000-000')
puts "IRD::Validator.validate('00-000-000') #=> #{validate_zero}"
puts "IRD::Validator.validate('49-098-576') #=> #{validate_eight}"
puts "IRD::Validator.validate('136-410-132') #=> #{validate_nine}"
puts "IRD::Validator.validate('100-000-000') #=> #{validate_invalid_nine}"