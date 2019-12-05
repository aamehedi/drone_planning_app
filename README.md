# README
Simple drone application. I am not able to complete all of the requirements,
though I have covered most of it.

**Note:** I have used ruby `2.6.5`, rails `6.0.1` and postgresql for database.

## Major things not covered
- I have skipped TDD completely. But it would be my first priority if I had more time.
- I didn't complete the view layer implementation for the warning of overlapping missions.
But I already add the instance method in `mission` model to identify if this mission is overlapping with any other missions.
- I wasn't able to finish the email sending feature. I have done part of it.
I have created the view of `show` action of `mission` controller to use it for sending email to pilots.
I have also added the `ReminderMailerJob` to run it as cron job, so that it could find missions that needs to be processed for sending email.
But I wasn't able to finish implementing email sending feature.

## Installation
- Download and cd into the source code
- `bundle install`
- `yarn`
- copy and configure `database.yml` from `database.yml.sample` in `config` directory.
- `rails db:migrate`
- Remove `config/master.key` and `config/credentials.yml.enc`
- Run `EDITOR=[YOUR PREFERED EDITOR NAME] rails credentials:edit` - it will open the encrypted rails credentials file with a default editor.
Add the following line at the end of the file:
```yaml
weatherbit_key: [YOUR WEATHERBIT API KEY HERE]
```
- Run `sidekiq` - to run and load **sidekiq** server, which will also load all cron jobs.
- Open another terminal and run `rails s` to run rails server.
