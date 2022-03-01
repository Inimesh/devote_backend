# Devote

Project by
 *Inigo Meshoulam
 *Christopher Webb
 *Ibrahim Chowdhury
 *Sarah Dousse
 *Francesco Colloto 

We used Ruby on rails for our backend and React for our frontend(https://github.com/Inimesh/devote_frontend)

We decided to use rails for it's auto generated test environments, and it's something we previously learnt on the course so it's sense famililarity

* Ruby version: ruby 3.0.0
* RVM version : rvm 1.29.12

##Setting up the application
    ``` git clone https://github.com/Inimesh/devote_backend.git
        cd devote_backend
        bundle install ``` 


* Database creation and initialization
    bin/rails db:create
    bin/rails db:migrate

* How to run the test suite
    ``` rspec ```  to run all test suites
    To run the specific test suites
    ```rspec example_file_name``` 

