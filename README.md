
# Real Estate Agency

- Final project.
- Web Applications Development
- Live demo: https://finalweb.herokuapp.com/

  | Alberto Juarez | Rafael Serna |
  |--|--|
  | A0128913 | A01282298 |
## README Index
- [Technical info](#technical-info)
- [Views](#views)
- [Endpoints](#endpoints)
- [Local installation](#local-installation)
# Technical info
- **Database:** PostgreSQL
- **Framework:** Rails
- **Sessions handler:** Devise
- **Image handler:** Active Storage

- **Database server:** Heroku Postgres
- **Image storage/server:** Amazon Simple Storage Service (S3)
- **Cloud platform/server:** Heroku


# Views

The application has different types of views depending on its user.

## Public view

The public view can be accessed by the end users and it is used to showcase the properties of the real estate agency, which can be modified if you are a user or an admin.

The general public has access to:

 - Home page
 - Search page
 - Properties page
 - About us page
 - Contact us page

## User view

This type of view is intended for the general public that wants to save a property that they like, they need to login to do this.

Once they have logged in and saved one or more properties, this will appear on the home page on the bottom section.

The user has the ability to add or remove properties from their saved ones.
## Agent view

This type of view is intended for the realtors in the agency to upload their properties as well as to have better control of their clients.

The normal user has access to all of the public views and:

 - Admin panel (including the messages set by the admin)
 - Their current clients (CRUD)
 - The listings that they manage (CRUD)
 - All the properties ( R )


## Admin view

This type of view is intended for the manager of the real estate agency.

The admin user has access to all of the user views and:

- All the properties (CRUD)
- All of the clients that everyone has (CRUD)
- All of the user and admin accounts (RUD)
- The properties that appear on the homepage
- The messages that appear on the admin panel (CRUD)

# Endpoints
The application counts with the following endpoints where `(:locale)` refers to the language which can be either 'en' for English or 'es' for Spanish and `:id` refers to the ID of that item.

Obviously not all endpoints are available to all users. This endpoints don't take into account the login/logout/registration for users.

| Method | Route |
|--|--|
| GET | /(:locale)|
| GET, POST | (/:locale)/properties |
| GET |  (/:locale)/properties/new |
| GET | (/:locale)/properties/:id/edit|
| GET,PUT,PATCH,DELETE | (/:locale)/properties/:id |
| GET | (/:locale)/contacto |
| GET | (/:locale)/nosotros |
| GET | (/:locale)/search |
| POST | /toggle_fav |
| GET,POST | /messages |
| GET | /messages/new |
| GET | /messages/:id/edit |
| GET,PUT,PATCH,DELETE | /messages/:id |
| GET,POST | /prospectos |
| GET | /prospectos/new |
| GET | /prospectos/:id/edit|
| GET,PUT,PATCH,DELETE | /prospectos/:id |
| GET | /misprospectos/:id |
| GET | /dashboard|
| GET | /dashboard/accounts|
| GET | /profile/:id|
| GET, PATCH | /featured|

# Local installation
In order to install this application on your local machine you need to have ruby and rails. To verify this you can run the following commands:

    ruby -v
    rails -v


Once you know that you have ruby and rails installed you can then clone this repository, run the bundle install in order to install the dependencies of the app, create the database and generate the tables for the app, once this is done you can run the server.

    git clone https://github.com/alberto-juarez/inmuebles.git
    bundle install
    rake db:create
    rake db:migrate
    rails server
