module ShowParams
  def show_json
    { id: id, first_name: first_name, last_name: last_name, patronymic: patronymic, phone_number: phone_number, email: email }
  end
end