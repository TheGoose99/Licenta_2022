  This is my Bachelor's Degree project. The project is a Full Stack app (front-end in Vue.js + back-end in Laravel) and the main goal of it is to simulate a functional cryptocurrency marketplace, containg many features which I will cover below:
  
  I. The main pages of the project are: 
  
 1. Landing Page;
 2. Login/Sign Up Pages;
 3. Transactions Page;
 4. Marketplace Page;
 5. Admin Panel;
 6. Profile Panel;
 
 II. The main functionalities of the project:
 
1. The ability to simulate the process of buying/selling cryptocurrencies on a marketplace in the Market Page, while the data is stored in a database so it doesn't get lost once the simulation of the process is over;
2. The ability to manage and modify the data on the website at your own will as an admin in the Admin Panel;
3. Simulation of unique user profiles which can be modified whenever the logged user wishes to;
4. Simulation of daily statistics about the amount of coin sold on the market, it's value in $ and the amount bought by the website, respectively percentage change compared to the last day of sell;
5. A marketplace with real data from an external API which reloads the data every minute in order to simulate giving the user the newest changes in price in real time;

 III. The main implemented concepts of the project:
 
1. A fully working sign up and login cycle. The ability to change password on request using your email and username;
2. Login and Sign Up protected by Reggex validation functions;
3. A well-thought SQL DataBase with various data tables and pivot tables for storing cryptocurrencies and users related data. Most tables have relationships between each other with foreign IDs or by taking advantage of the Laravel's Eloquent Relationships;  
4. A fully functional marketplace with over 100 cryptocurrencies with real data from an external API which automatically refreshes itself every second. The pages contains 3 panels sorted by: 
   a. Top Coins By Volume; 
   b. Traded Value;
   c. Trendy Coins;
 and a 4th table containing 25 cryptocurrencies sorted by trendiness, containing various details about them like price change, price percentage change, volume, last updated price change and so on. The table contains pagination which repopulates the table with the next 25 cryptocurrencies.  
3. A beautiful dialogue panel for selecting cryptocurrencies when buying or selling crypto, while showing the price change of those and their current market value. 
4. The implementation of a user validation requirement MiddleWare on the backend side, for trading cryptocurrency.
5. You can become eligible to trade cryptocurrency by filling up data in the Profile Tab, situated in the Settings Tab. The Profile Tab is segmented in 4 mini-tabs:
  a. View Profile, where you can check what data you have validated or you can edit your profile there;
  b. Change Username, which is only possible if the required username is available in the database, as all usernames and e-mails are unique in it;
  c. Change Password;
  d. Change billing, where you can also see your transactions;
6. The concept of roles with different level of permissions and accesability on different pages of the website;
6. Routing security in front-end, you cannot enter the Transactions Page unless you are logged into an account;
7. Routing security in back-end, you cannot request certain data unless you have a certain role (example: Admin for Admin Panel) on certain pages. Data is protected by Permissions and middlewares;
8. The ability to see and access an Admin Panel only as an Admin. The Admin Panel is used for data statistics regarding crypto transactions or for visualising, modifying, deleting or inserting data into different tables (Roles, Users, Stocks, Bought Crypto, Sold Crypto, etc);
9. Use of Mixins to reduce the repetition of code. In place where code might repeat itself, I am using a file containing it in order to reduce the need to rewrite it;
10. Use of reusable components for base elements (example: Base Dialogue, Base Button, Base Badge, etc)
  and many more...
 
  IV. Software requirements: 
 
 1. Node.js installed (17.5.0 is the used production version for the project);
 2. PHP > 8.0.0 (required in order to run Laravel 9);
 3. Composer installed (required in order to run Laravel 9);
 
  V. How to run the project:

 1. Clone the repository;
 2. In the terminal run "npm install";
 3. After that, in the terminal run "composer install";
 4. Turn on your local server (example: WAMP, XAMP);
 5. Import the database named "laravel_dblicenta";
 6. In the terminal run "cp .env.example .env";
 7. Open the .env file and make sure the value of DB_DATABASE is the name of the database (example: 'DB_DATABASE=laravel_dblicenta');
 8. Once all these steps have taken place, you can run in two separate terminals "npm run serve" and "php artisan serve";
 9. The project is now fully accesible;

  VI. Used frameworks: 
  
  About Laravel

 <p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

  Laravel is a web application framework with expressive, elegant syntax. We believe development must be an enjoyable and creative experience to be truly fulfilling. Laravel takes the pain out of development by easing common tasks used in many web projects, such as:

- [Simple, fast routing engine](https://laravel.com/docs/routing).
- [Powerful dependency injection container](https://laravel.com/docs/container).
- Multiple back-ends for [session](https://laravel.com/docs/session) and [cache](https://laravel.com/docs/cache) storage.
- Expressive, intuitive [database ORM](https://laravel.com/docs/eloquent).
- Database agnostic [schema migrations](https://laravel.com/docs/migrations).
- [Robust background job processing](https://laravel.com/docs/queues).
- [Real-time event broadcasting](https://laravel.com/docs/broadcasting).

  Laravel is accessible, powerful, and provides tools required for large, robust applications.

  About Vue.js
  
  <p align="center"><a href="https://vuejs.org" target="_blank"><img src="https://camo.githubusercontent.com/c8f91d18976e27123643a926a2588b8d931a0292fd0b6532c3155379e8591629/68747470733a2f2f7675656a732e6f72672f696d616765732f6c6f676f2e706e67" width="400" height="400"></a></p>

  Vue is a progressive framework for building user interfaces. It is designed from the ground up to be incrementally adoptable, and can easily scale between a library and a framework depending on different use cases. It consists of an approachable core library that focuses on the view layer only, and an ecosystem of supporting libraries that helps you tackle complexity in large Single-Page Applications.
  
  Vue.js supports all browsers that are ES5-compliant (IE8 and below are not supported).
