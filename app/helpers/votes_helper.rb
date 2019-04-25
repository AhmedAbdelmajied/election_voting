module VotesHelper

  def is_allowed_age string_date
    begin
      dob = DateTime.parse(string_date)
    rescue
      return false
    end
    now = Time.now.utc.to_date
    age = now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
    return ( age > 18 && age < 120)
  end
end
