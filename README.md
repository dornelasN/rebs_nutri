# Rebs Nutri application

This README is temporary and will be updated as the projects gets created and updated.

Rebs Nutri is an application for Rebeca Cipriano to send her nutrition diets to her patients in Brazil.

At first, she will be able to send her patients the diets in a PDF file which they can view on their profile pages.
As I progress through the application, she should be able to write the diets in detail on the website itself.

All the layouts and the flow of the website are subject to change as I progress through the code with her inputs.

The base of this application was created with the Ruby on Rails Tutorial by Michael Hartl.

[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](http://www.railstutorial.org/)
by [Michael Hartl](http://www.michaelhartl.com/).

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

For more information, see the
[*Ruby on Rails Tutorial* book](http://www.railstutorial.org/book).
