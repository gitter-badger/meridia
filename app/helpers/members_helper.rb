module MembersHelper
  def age(birthday)
    now = Time.now.utc.to_date
    now.year - birthday.year - (birthday.to_date.change(:year => now.year) > now ? 1 : 0)
  end

  def sex( gender )
    ( gender == "male" ) ? "Masculino" : "Femenino"
  end

  def yes_or_not( answer )
    ( answer && answer == 1 ) ? 'Si' : 'No'
  end
end
