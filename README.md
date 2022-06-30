# Validations Station

You've been tasked with designing a system that will automate some operations for a railway system.  For each station in the system, your app will be able to assign incoming trains to a vacant platform, as well as publish the arrival and departure schedules for individual stations.

You'll be adding validations to the provided models as specified below using [ActiveRecord validation helpers](https://guides.rubyonrails.org/active_record_validations.html). There is also some seed data provided in `db/seeds.rb` to give you some data so you can test your models.

![gare du nord paris](./public/03-gare-du-nord-cr-corbis.jpg)

## Setup
- `bundle install`
- `rails db:migrate`
- `rails db:seed`
- `rails c`

_Note: If you need to reseed your database, be sure to run `rake db:seed:replant` so as not to create duplicate records._

## Model Associations
The migrations and models are already done for you, and associations should be as follows: 

Station --< Platform --< Assignment >--Train

The relationship between `platforms` and `trains` is many-to-many through `assignments` because the same train could be assigned to different platforms in the same station on different days depending on the other traffic through the station.

![domain diagram](./public/train_station.png)

## Instructions

- Add the appropriate code to each model to meet the requirements below
- Some models may need association macros as well as validations
- You do not need to create routes or controllers for this challenge
- There are no tests, so you'll need to test your code in Rails' console
- Test your validations by trying to create model objects which deliberately violate them.
- When creating `Assignment` objects, enter `arrival` and `departure` strings in the format "HH:MM" 

_Note: Remember that model objects which fail ActiveRecord validations contain an error object which may be accessed with `model_instance.errors` or `model_instance.errors.full_messages`_


## Deliverables

### `Station`
- must have a `name`
- `name` must be at least 3 characters long
- `name` must be unique

### `Platform`
- `platform_num` must be an integer
- `platform_num` must be in the range 1-20 (inclusive)
- BONUS: `platform_num` must be unique to each station

### `Train`
- must have an `origin` and a `destination`
- `origin` and `destination` strings must be between 3 and 24 characters long, inclusive
- `service_type` must be either "express" or "local"

### `Assignment`
- must have `arrival` and `departure` times

BONUS (see the docs on [custom validation methods](https://guides.rubyonrails.org/active_record_validations.html#custom-methods) to help with these):
- must arrive before it departs
- must not stay at platform for more than 20 minutes
- must only be assigned to a vacant platform

_Note on the `:time` datatype: some implementations of SQL distinguish between `time` and `datetime` data, and others do not. Sqlite is the latter, so ActiveRecord will coerce your "HH:MM" string into a full `datetime` object, adding a default date of "2000-01-01" and assuming the timezone is UTC 0.  You can complete all of the bonus validations without any further conversion, and `datetime` objects can be operated on with artihmetic (+ - * /) and comparison (>, <, >=, etc) operators as if they were number types. Arithmetic operations may return in time units other than what you expect however!_  😉
