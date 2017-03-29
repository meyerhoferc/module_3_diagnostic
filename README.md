## README

#### About

Welcome to AltFuelFinder!

AltFuelFinder uses the [NREL API](http://developer.nrel.gov/) to find alternative fueling stations by zipcode. To use the application, in addition to the standard Rails setup below, type in a zipcode in the search bar and hit 'Search.'

The results are defaulted to search within a 6.0 mile radius of the entered zipcode and return the 10 closest stations, in order of the closest to the entered zipcode. The returned stations serve either electric or propane fuel.


#### Run through the standard Rails setup.

```
$ bundle install
$ rake db:{create,migrate}
$ rails s
```

Navigate to `http://localhost:3000`

#### Testing

To run the test suite,

```
$ rspec
```
