<!--
*** Thanks for checking out the Best-README-Template. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Thanks again! Now go create something AMAZING! :D
***
***
***
*** To avoid retyping too much info. Do a search and replace for the following:
*** github_username, repo_name, twitter_handle, email, project_title, project_description
-->



<!-- PROJECT SHIELDS -->
<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

# Little Esty Shop
<!-- TABLE OF CONTENTS -->
<summary><h2 style="display: inline-block">Table of Contents</h2></summary>
<ol>
  <li><a href="#about-the-project">About The Project</a>
  <li><a href="#project-board">Project Board</a></li>
  <li><a href="#built-with">Built With</a>
  <li><a href="#setup-instructions">Setup Instructions</a></li>
  <li><a href="#contact">Contact</a></li>
  <li><a href="#acknowledgements">Acknowledgements</a></li>
</ol>

<!-- ABOUT THE PROJECT -->
## About The Project

[Little Esty Shop](https://les-jhennerich.herokuapp.com/)  is a two-part project for the Turing School of Software & Design. The application resembles an e-commerce platform where merchants and administrators can manage inventory and fulfill customer invoices, and customers can make purchases. The project is broken into two parts, the first a 4 person group project, and a solo project.

User stories tracked using [Github projects](https://github.com/jhennerich/little-esty-shop/projects/1).

### [Part 1](https://github.com/turingschool-examples/little-esty-shop):

#### Skills Developed in part 1
* Designed schema with custom tasks for database seeding
* Used advanced ActiveRecord to perform complex database queries
* Practiced MVC concepts, effectively staying within rails conventions
* Consumed github API and utilized POROS as a way to apply OOP principals  


### [Part 2](https://github.com/turingschool-examples/little_esty_shop_bulk_discounts):

#### Skills Developed in part 2
* Used advanced ActiveRecord to perform complex database queries
* Practiced MVC concepts, effectively staying within rails conventions
* Implemented checkout and payment functionality using POROs and Nager Holiday API implementation
* Deployed application on [Heroku](https://les-jhennerich.herokuapp.com/)

<!-- PROJECT BOARD -->
## Project Board
Check out the [Project board](https://github.com/jhennerich/little-esty-shop/projects/1)
for a complete list of features / user stories used to develop this application.

<!-- BUILT WITH -->
## Built With

* [Ruby on Rails](https://rubyonrails.org/)
* [Postgresql](https://www.postgresql.org/)

<!-- SETUP INSTRUCTIONS -->
## Setup Instructions
To get a local copy up and running follow these simple steps.

1. Clone the repo
   ```
   git clone https://github.com/jhennerich/little-esty-little_esty_shop_bulk_discounts
   ```
2. Install dependencies
   ```
   bundle install
   ```
3. DB creation/migration
   ```
   rails db:create
   rails db:migrate
   rails csv_load:all
   ```
3. Run tests and view test coverage
   ```
   bundle exec rspec
   open coverage/index.html
   ```
4. Run server and navigate to http://localhost:3000/
   ```
   rails s
   ```

OR

1. Visit heroku
   https://les-jhennerich.herokuapp.com/
