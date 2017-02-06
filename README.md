# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


callback = "http://localhost:3000/users/auth/ninthdecimal/callback"
app_id =  'e3db24acfd929ef2aafbd84b9070e333dae9753c70030364c842f4258b92c47c'
secret = '342cda7e00ba795a473bd943448020996d38b8cfdcb10bc28679c6e7e547b22e'
client = OAuth2::Client.new(app_id, secret, site: "http://localhost:9000")
client.auth_code.authorize_url(redirect_uri: callback)
access = client.auth_code.get_token(RETURNED_CODE, redirect_uri: callback)
access.token # access_token !
