# BBQ

## Description

Event management app in which you can create events, subscribe to them, comment on them, attach photos, restrict access to them.

Carousel and viewer are organized for photogallery. Subscribers receive letters using mailer.

GitHub and Google authentification is implemented.

Event places are displayed on the built-in Yandex.maps.

Realized in Ruby on Rails 7. 

Language: Russian.

## Launching

1. Download or clone repo.

2. Use your own credentials as in examples
```
cp config/database.yml.example config/database.yml
cp .env.example .env
```
Don't forget about `master.key`!

3. Use bundler
```
bundle install
```

4. Create database
```
rails db:create
```
5. Run database migrations
```
rails db:migrate
```
