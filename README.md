# Driving History
This repo contains a Ruby app that takes in a file with driver info along with travel details and returns a driving history report listing drivers from most miles driven to least miles driven with average speed.

## Getting Started :
1. First step is to clone this repo into a directory of your choosing:
   
   `$ git clone https://github.com/mysteryboy73/Driving-History.git`

2. Once you've cloned the repo navigate to the directory you cloned it to:

    `$ cd */Driving-History`

3. You then need to create a text file in the following format with driver and trip information

    ```
    Driver Dan
    Driver Lauren
    Driver Kumi
    Trip Dan 07:15 07:45 17.3
    Trip Dan 06:12 06:32 21.8
    Trip Lauren 12:01 13:16 42.0
    ```

4. You can then execute the app by running the following command:
   
   `$ ruby main.rb {file-name}.txt`
   > File name should be the name of the file that contains your driver and trip data you created

5. When executed with your input file in the correct format with the neccessary data you should receive a **driving_history_report.txt** containing the results of the driving history
   
    ```
    Lauren: 42 miles @ 34 mph
    Dan: 39 miles @ 47 mph
    Kumi: 0 miles
    ```

> If the input is not formatted correctly or contains no data then you should get a message saying *Report not generated. There was not enough information found in file to generate the report.*

## Running Unit Tests

If you would like to run the unit tests for this project I've included a rake task that can be utilized following these steps.

1. Navigate to your repo directory and install bundler if you don't already have it:
   
   `$ gem install bundler`

2. Once you have bundler installed you can run this command to install neccessary gems for the tests:
   
   `$ bundle install`

3. When that completes successfully you should now be able to run the rake task that runs all the tests:

    `$ bundle exec rake spec`

## Thought Process / Design Decisions :

* When approaching this problem my head immediatley thought about an ETL (*Extract, Transform, Load*) pattern. The problem at hand calls for *Extraction* of data from a file. *Transformation* of the data to form report data and *Loading* to write that new data to a file. Thinking in these terms I tried to create re-usable abstractions in my code that allowed each piece to only be responsible for specific tasks making them independently testable.

    The following are the main classes that I created to try and follow this approach :

    ```
    FileParser
    LineItemGenerator
    FileReportFormatter
    ```

    **FileParser (Extract) :**

    The file parser is responsible for opening the file and extracting out the data to our domain objects *Driver* and *Trip*.

    **LineItemGenerator (Transform) :**

    Once we have *Driver* and *Trip* objects those can then be passed on to the line item generator transforming that data by matching trips to drivers resulting in another domain object called *DriverReportLineItem*.

    **FileReportFormatter (Load) :**

    The report formatter can then take our *DriverReportLineItems* and map each of them to a formatted string that will be written to the report file as the content.


* With my domain objects I decided to use *encapsulation* to expose some information about the objects such as total trip times instead of exposing a bunch of attributes that would then have to get set by another object. 

* Having this *encapsulation* allowed me to take a functional approach with my classes that do the *ETL* work. Instead of holding state and manipulating objects I was able to ask the objects questions to for a new object that would be created and returned.
