# Property Service

In this service given latitude and longitude of an object, its type and marketing type, returns a list of similar objects with their prices.

## Setup

Clone the repository

```
git clone git@github.com:angela4713/property-service.git
```

Run bundle

```
bundle install
```

Run migrations

```
rake db:create db:migrate
```

## Tests

Run all the tests

```
bundle exec rspec
```

## Usage

Run the application

```
rails s
```

## Methods
### find properties

Given `longitude`, `latitude`, `property_type` and `marketing_type` find properties in 5 km radius.

** Endpoint and request example: **

`GET /api/v1/properties/nearby?lng=13.4236807&lat=52.5342963&property_type=apartment&marketing_type=sell`

** Response example: **

```
[
  {
    "house_number": "36",
    "street": "Prenzlauer Allee",
    "city": "Berlin",
    "zip_code": "10405",
    "lat": "52.5346344",
    "lng": "13.4224666",
    "price": "239500.0"
  },
  {
    "house_number": null,
    "street": null,
    "city": "Berlin",
    "zip_code": "10405",
    "lat": "52.5327964",
    "lng": "13.4225659",
    "price": "142900.0"
  },
  {
    "house_number": null,
    "street": null,
    "city": "Berlin",
    "zip_code": "10405",
    "lat": "52.5327964",
    "lng": "13.4225659",
    "price": "399500.0"
  }
]
```
