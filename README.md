# sc-backend:

This is the Rails api for the Sustainable Citizen Project. 

#### Setup:
* Ruby version: `ruby 2.3.3p222 (2016-11-21 revision 56859) [universal.x86_64-darwin17]
`
* Rails version: `Rails 5.2.1`
* Rbenv version: `Rbenv 2.3.1`
* Rvm version: `Rvm 2.3.1`

#### Run tests with: 
```
bundle exec rspec 
```

#### Run on localhost with: 
```
rails s 
```

---

### How to Create a New Object: 

##### 1. Create a new model 
Example: 

```rails g model Sample title:string```

##### 2. Verify, Change, and run Migration  
Make any changes that you need to and then run the following: 

```rails db:migrate```

##### 3. Write tests in `spec/models/new_object_spec.rb`
Example: 
```ruby
RSpec.describe Sample, type: :model do
  it { should validate_presence_of(:title) }
end
```

##### 4. Create model in `app/models/new_object.rb`
Example:
```ruby
class Sample < ApplicationRecord
  validates_presence_of :title
end
```

##### 5. Create a new controller for that model 
Example: 
```
rails g controller Samples
```

##### 6. Add object to `routes.rb` then run the following
Example `routes.rb `: 
```ruby
Rails.application.routes.draw do
  resources :samples do
  end
end
```
Then run this: 
```
rails routes 
``` 
---

### Oauth2.0:
#### 1. Create a test user
Use the following rails console command to create a test user by using devise
```
User.create!(email: 'x@xxx.com', password: '000000')
```

#### 2. Request a new token
API for request a new token: `POST /oauth/token` with the header `Content-Type: application/json` and the body
```javascript
{
   "grant_type" : "password",
   "username"   : "x@xxx.com",
   "password"   : "000000"
}
```

---
### Docker: 
#### Building your docker image: 
```
docker build -t sc-backend .
```
#### Starting up docker container: 
```ruby
docker-compose up 
```
#### Seeing all containers currently running: 
```ruby
docker ps 
```

---
Using this tutorial as a reference: https://scotch.io/tutorials/build-a-restful-json-api-with-rails-5-part-one 
