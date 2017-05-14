# Live Traffic Disruptions - TIMS

### Run project:
Install gems:
`bundle install`

Run migrations:
`rake db:migrate`

Start server:
`rails s`

Get API :
`http://localhost:3000/api/v1/disruptions.json`

### Run scheduler
On prod use to update cron:
`whenever --update-crontab`


### Tests

Run:
`rspec`
for run tests
