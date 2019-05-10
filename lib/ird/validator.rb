module IRD
  module Validator
		FIRST_WEIGHT = 32765432.freeze
		SECOND_WEIGHT = 74325276.freeze

    def self.validate(ird_number)
      ird_number = (ird_number.is_a? Integer) ? ird_number : ird_number.gsub('-', '').to_i 
      return false if ird_number < 10000000 || ird_number > 150000000

      last_digit = ird_number % 10
      main_number = ird_number / 10 # ruby integer division is flooring division
      
			first_check = self.weighted_check(main_number, FIRST_WEIGHT)
			return first_check == last_digit if first_check < 10

			second_check = self.weighted_check(main_number, SECOND_WEIGHT)
			# no point checking whether it's 10, last digit is always between 0 and 9
			return second_check == last_digit
    end

    def self.weighted_check(number, weight)
			checksum = 0

			# if we have 0 after dividing by 10 there is nothing else to do.
			while number > 0
				checksum += (number % 10) * (weight % 10)

				# discard the digits we've summed up already
				number = number / 10
				weight = weight / 10
			end

			return (-checksum) % 11 
    end
  end
end
