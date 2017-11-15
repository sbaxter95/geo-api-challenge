# Devices API

A challenge for GEO to build and test an api, based on a provided XML file. The root url is the homepage of the api. To see all devices, use '/devices', and to search for a particular device, use /devices/{device name}. An error will occur if the device does not exist

## Technology and Tools used

* Ruby **2.4.1**
* Sinatra MVC microframework **2.0.0**
* rspec testing framework **3.7.0**
* json gem **2.1.0**
* nokogiri gem **1.8.1**
* active_support gem **5.0.0**
* rack - allows app to be launched **2.0.3**
* rack-test - allows rack app to be tested **0.7.0**
* git and github for version control **2.15.0**
* bundle gem **0.01**

## Installing

* Firstly clone or download the files from the git repository
* Navigate to the directory in the command line
* Run the ```bundle``` command to install all dependencies - if the bundle gem is not installed, the run ```bundle install```
* Run the api using the ```rackup config.ru```
* To run the tests, run the ```rspec``` command

## Modifying

* The config.ru file can be modified to change the environment of the application
* The spec_helper file can be use dto modify and configure rspec and its output in the terminal
* New services can be added to the API by adding another class to the lib directory
* Methods can be added to the new class, which can then be called from the main routes class
* Add the new classes to both the test spec files and routes
