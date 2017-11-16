class Homepage

  def show_homepage_content
    output = "Welcome to the Devices API \n /devices to get all devices \n /devices/:name to return the notes of a specified device \n /devices/random to return a random device \n /devices/value/:value to return a devicebased on its value \n /devices/single/:name to return a single device based on its name"
    return output
  end

end
