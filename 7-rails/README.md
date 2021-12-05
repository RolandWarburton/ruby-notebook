# Rails API

First create the boilerplate.

```none
rails new --database postgresql --api myApi
```

---

Next get postgres working, 
notice that inside the `Gemfile` there is already a pg gem because of the flag we passed.

If the gem is not in the Gemfile,
add it `gem 'pg', '>= 0.18', '< 2.0'` then `bundle install`

---

Next go to `config/database.yml` and configure user setting stuff.

Boot the postgresql shell `sudo -u postgres psql`

```none
postgres=# \du
                                   List of roles
 Role name |                         Attributes                         | Member of
-----------+------------------------------------------------------------+-----------
 postgres  | Superuser, Create role, Create DB, Replication, Bypass RLS | {}
 roland    | Superuser                                                  | {}
```

Then we need to create some of the databases as seen in `database.yml`.

```none
CREATE DATABASE myApi_development;

\list
```

Then create a user to access that database.

```sql
CREATE USER myapi_user;

ALTER USER myapi_user PASSWORD 'rhinos';
-- or if you just dont care (because it didnt work for me
ALTER USER myapi_user WITH SUPERUSER;

CREATE USER myapi_user_production;
ALTER USER myapi_user_production PASSWORD 'rhinos';
ALTER USER myapi_user_production WITH SUPERUSER;

CREATE USER myapi_user_test;
ALTER USER myapi_user_test PASSWORD 'rhinos';
ALTER USER myapi_user_test WITH SUPERUSER;
```

This next part is not required, db:create will do it for you (should do anyway).
I am just leaving it here as instruction for manually creating the database without rake.

```sql
GRANT ALL PRIVILEGES ON DATABASE myapi_development to myapi_user;
ALTER DATABASE myapi_development owner to myapi_user;
ALTER USER myapi_user VALID UNTIL 'infinity'
```

Now in `config/database.yml` it should look like this.

```yml
default: &default
  adapter: postgresql
  encoding: unicode
  host: localhost
  pool: <%= ENV.fetch("RAILS_MAX_THREADS") { 5 } %>

development:
  <<: *default
  database: myapi_development
  username: myApi_User
  password: rhinos

test:
  <<: *default
  database: myapi_test
  username: myapi_user_test
  password: rhinos

production:
  <<: *default
  database: myapi_production
  username: myapi_user_production
  password: rhinos
```

You should be able to run `rake db:create`. This will generate myapi_development and myapi_test 
but **not** production, to do that pass in `RAILS_ENV=production rake db:create`.

We know that only the 2 dev, and test exist because we can run `\l` inside
the psql shell and see the databases that exist.

---

Next we need to learn about migrations, migrations solve schema changes over time.

The term **table** is a collection that is contained within a database.
Tables contain **columns** that have **rows** of data.

Lets make a migration to create a new table about "robots".

```none
rails generate migration CreateRobots name:string type:string fly:boolean
```

That will generate a new file for us.

```none
Running via Spring preloader in process 918522
      invoke  active_record
      create    db/migrate/20211204103704_create_robots.rb
```

The naming of CreateRobots is particular to rails,
it relies on the fact that we used the word "Create" which rails can
interpret to generate the correct migrations. Double check the generated file that it
contains some code that relates to the columns you specified.

Now we need need to apply the migration with `rake db:migrate`.

```none
== 20211204103901 CreateRobots: migrating =====================================
-- create_table(:robots)
   -> 0.0194s
== 20211204103901 CreateRobots: migrated (0.0199s) ============================
```

If we wanted to make a change we can add new migrations and rails will track them.

---

Now lets create a **scaffold** for a new route.

To use the scaffold tool, we will remove the migration
because scaffold will do the migration stuff for us.

```none
rake db:migrate VERSION=20211204103901
rm db/migrate/20211204103901_create_robots.rb
```

You probably need to check this actually removed the table, it didnt for me.

Then generate a scaffold.

I also found that i needed to run `bin/spring stop` because in my testing i did something wrong and broke spring.

```none
rails generate scaffold robot name:string type:string fly:boolean
```

This will generate a whole lot of files.

```none
Running via Spring preloader in process 1118300
      invoke  active_record
      create    app/models/robot.rb
      invoke    test_unit
      create      test/models/robot_test.rb
      create      test/fixtures/robots.yml
      invoke  resource_route
       route    resources :robots
      invoke  scaffold_controller
      create    app/controllers/robots_controller.rb
      invoke    test_unit
      create      test/controllers/robots_controller_test.rb
```

To remove the scaffold run.

```none
rails destroy scaffold robot
```

Lets understand what was created.

* app/models/robot.rb - interact with the database here
* test/models/* - test the model here
* resource_route - add a route in config/routes.rb
* app/controllers/robots_controller.rb - this is where http request starts its life

---

Lets understand the route that was created.

```none
Rails.application.routes.draw do
  resources :robots
end
```

Next lets look at `app/controllers/robots_controller.rb`.

Before we write code, lets try hitting the endpoint /robot and see what happens.

`rails server` to start the server.

Whoops, maybe you need to apply migrations (if you get a complaint).
Do this with `rails db:migrate`, this will create the database schemas in postgresql.

Ok, now you can probably get to the endpoint, but /robot does not exist,
however /robots does. Rails has pluralized the route and inside the controller
we can see all the different ways of interacting with it (GET, POST etc).

We can now GET and POST robots (almost).

Bu whoops! Another error, this time when we POST a new robot to /robots.

```none
#<ActiveRecord::SubclassNotFound: The single-table inheritance mechanism 
failed to locate the subclass: 'mechanic'. This error is raised because the 
column 'type' is reserved for storing the class in case of inheritance. 
Please rename this column if you didn't intend it to be used for storing the 
inheritance class or overwrite Robot.inheritance_column to use another column 
for that information.>"
```

We are not allowed to use "type" as a field in the database, lets roll back and try again.

```none
rails generate migration RemoveTypeFromRobots type:string
rails generate migration AddTypeToRobots profession:string
```

Then we can run `rake db:migrate` again.

Next lets make a quick change:
to ensure that we get all the required data in our new robot POST
lets require all the fields using a rails presence validator.

This is model-specific code so it belongs in `app/models/robot.rb`.

```ruby
class Robot < ApplicationRecord
  validates :name, :profession, :fly, presence: true
end
```

Next we need to fix the controller code so that we allow the new params.

```ruby
# Only allow a trusted parameter "white list" through.
def robot_params
  params.require(:robot).permit(:name, :profession, :fly)
end
```

Now a request like this should work.

```json
{
    "name": "boba",
    "robot_type": "mechanic",
    "fly": "false"
}
```

And a request like this should fail.

```json
{
    "name": "boba",
    "fly": "false"
}
```

Lets make the name column unique as well.

I will just create the new migration manually and then edit it


```none
rails generate migration change_unique_name name:string
```

Then wrote this code.

```ruby
class ChageUniqueName < ActiveRecord::Migration[5.1]
  def change
    remove_column :robots, :name, :string
    add_column :robots, :name, :string
    add_index :robots, :name, unique: true
  end
end
```

Now the name column is guaranteed to be unique.