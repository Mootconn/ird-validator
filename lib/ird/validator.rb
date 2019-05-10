module IRD
  module Validator
    def self.validate(irdnum)
      ird = (irdnum.is_a? Integer) ? irdnum : irdnum.gsub!('-', '').to_i 
      ird = irdnum.to_i if ird == 0
      return false if ird < 10000000 || ird > 150000000
      last_digit = ird.to_s[-1].to_i
      number = ird.to_s[0..-2].to_s.rjust(8, '0').to_i
      check_digit = self.weighted_check(ird, 32765432)
      if check_digit < 10 
        return check_digit == last_digit
      else
        second_check = self.weighted_check(ird, 74325276)
        if second_check < 10 
          return second_check == last_digit
        else
          return false
        end
      end
    end
    def self.weighted_check(irdnum, weight)
        counter = 0
        check = Array.new
        check_digit = irdnum.to_s.chars.each do |v| 
          check.push(v.to_i * weight.to_s.split('')[counter+1].to_i) if irdnum.to_s.count('0123456789') == 8
          check.push(v.to_i * weight.to_s.split('')[counter].to_i) if irdnum.to_s.count('0123456789') == 9
          counter += 1
        end
        counter = 0
        check_final = check.inject(0, :+) % 11
        return 0 if (check_final === 0)
        return 11 - check_final
    end
  end
end
