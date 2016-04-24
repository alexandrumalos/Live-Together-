LiveTogether README
==

LiveTogether is a site designed for individuals across the world to be able to connect online with other individuals in the same neighborhood or spatial area. This site allows communication through messaging, text-based posts, and events created by many different users.

A working example can be found at https://live-together-1234.herokuapp.com/

Setup
--

#### Before you begin

* Check to make sure your version of Rails is up to date with our Gemfile. We currently user Rails version 4.2.5

* While our app should work fine on any modern system, this app has only been tested on Windows and Linux (both ArchLinux and Ubuntu) since those are the operating systems currently used by the developers. Macs and Macbooks should run the app just as smoothly but be aware that issues may occur that we were not able to see given our inability to test on Apple products

#### Let's Get Started

This setup tutorial assumes that you want to set up the app to run locally. Instructions are not provided here for setting up on Heroku

* Begin by cloning this repository. This can be done once git is installed by copying the git url for this repository and running the following command but replacing &lt;url&gt; with that git url

```bash
git clone <url>
```

* Then, move into the cloned url. The command should be something like

```
cd Semester-Project-for-Malos-Watson-Birt
```

* Next, Install all dependencies by running

```bash
bundle install
```

* In order for picture uploading to work on a server other than localhost, an Amazon Web Services (AWS) account must be setup. However, since this tutorial only covers a local setup, steps for how to setup an AWS account will not be discussed in this tutorial. When offline, the app is set to use local file storage for storing uploads so make sure that the user running the app has permissions to create files in this app's folder

* Next, the database will need to be created by running the following command

```bash
rake db:migrate
```

* when that command finishes, you can then populate the database with default entries with the following command

```bash
rake db:seed
```

This will create several users, neighborhoods, posts, etc. but if you only want the admin user to be created and no other users, replace the contents of db/seeds.rb with the following

```ruby
# Clear the database
Category.delete_all
Comment.delete_all
Event.delete_all
Group.delete_all
Message.delete_all
Neighborhood.delete_all
Post.delete_all
Request.delete_all
User.delete_all

# Create Admin
User.new(name: 'Admin', username: 'admin', password: 'admin123', user_type: 'admin', email: 'admin@email.com').save!
```

Then replace 'admin123' with the password to be used for the admin account and re-run `rake db:seed`. The username for the admin account will be `admin` and the password will be `admin123` unless you chose to change the password

Note that only one admin account is allowed to exist at a time, so be sure not to delete your admin account or else the site is vulnerable to having an intruder create their own admin account
