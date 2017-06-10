# FoodyCall
Cook Together, Happy Together
Application to help user to create public or private events for cooking with
friends or meet people while cooking. Also the user assigns different roles

# How to Run
1. Install all dependencies
```
  bundle install
```

2. Make a copy of config/conf_env.rb.example and name it config/conf_env.rb
3. Generate MSG_KEY by using the command
```
  rake key:generate
```
4. Copy key and paste it inside config/config_env
5. Generate DB
```
  rake db:reseed
```
6. Run Server
```
  rackup
```
