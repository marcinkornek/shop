## Ruby on Rails + AngularJS app
I am going to make simple shop website

## Used gems

* [*slim-rails*](https://github.com/slim-template/slim-rails) - to use slim-template

* [*figaro*](https://github.com/laserlemon/figaro) Heroku-friendly Rails app configuration using ENV and a single YAML file, to send secrets to heroku it's just
'figaro heroku:set -e production' in terminal

* [*sorcery*](https://github.com/NoamB/sorcery) authentication for Rails, version 0.8.6 works with Rails 4.0+, to use omniauth login with sorcery i use gems: [*omniauth-google-oauth2*](https://github.com/zquestz/omniauth-google-oauth2) and [*omniauth-facebook*](https://github.com/mkdynamic/omniauth-facebook). To avoid sending confirmation email when registering with omniauth I use model User method:
  ```ruby
  attr_accessor :send_activation_email
  def send_activation_needed_email!
    super if send_activation_email
  end
  ```
* [*ng-annotate*](https://github.com/olov/ng-annotate) adds and removes AngularJS dependency injection annotations - example on page

* [*roar-rails*](https://github.com/apotonick/roar-rails) - great Rails representer

* [*carrierwave*](https://github.com/carrierwaveuploader/carrierwave) - uploading files (in my app I upload images) in Rails app, with this gem I use gems: [*rmagick*](https://github.com/rmagick/rmagick) to process images (resize etc.) and [*fog*](https://github.com/fog/fog) to send images to Amazon S3

* [*will_paginate*](https://github.com/mislav/will_paginate) - pagination for Ruby on Rails


## Used plugins/frameworks
* [*angular-carousel*](https://github.com/revolunet/angular-carousel) - great carousel for AngularJS, but has problems with Angular 1.3 :/ it has to be fixed height and width in css, without this it has height = width = 0, carousel uses Angular-touch so carousels can be switched with touch
ul[rn-carousel] {
  width: 300px;
  height: 300px;
}

* [*angular-bootstrap*](http://angular-ui.github.io/bootstrap/) - 'bootstrap' for AngularJS - many useful directives. There is also carousel but it's not as configurable as in 'angular-carousel' plugin,

* [*ngInfiniteScroll*](https://github.com/sroze/ngInfiniteScroll) - infinite scroll plugin for AngularJS - very useful but it's not so easy to configure it with $resource (in example it is $http), on server side to split records I use gem [*will_paginate*](https://github.com/mislav/will_paginate)

* [*angular-ui-router*](https://github.com/angular-ui/ui-router)- routing framework for AngularJS, better than 'ngRoute', allows named states, nested and parallel views..
