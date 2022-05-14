# Links/URL Shortener

## Table of Contents

- [About](#about)
- [Getting Started](#getting_started)

## About <a name = "about"></a>
#### English
This is a link shortening site like [bitly](https://bitly.com/ "bitly"). It is also possible to view the statistics of clicks on links.
#### Russian
Это сайт для сокращения ссылок похожий на [bitly](https://bitly.com/ "bitly"). Есть возможность просматривать статистику переходов по ссылкам.

## Getting Started <a name = "getting_started"></a>
The active version of the site where you can try to shorten links is [here](https://cut-your-url.herokuapp.com/ "here").
To start using the application (run a local server) you need: Ruby on Rails 7.0.1, Ruby 3.0.2, Bundler.
#### Windows
You can get all the necessary tools by downloading [RubyInstaller](https://rubyinstaller.org/ "RubyInstaller").
#### Linux
Good instruction is [here](https://www.tutorialspoint.com/ruby-on-rails/rails-installation.htm "here").

### Installing

Use `git clone` in command line being in desired directory.

```
$ git clone https://github.com/SlavaNixon/url-shortener .
```

After clone start `bundle`

```
$ bundle
```

After installing gems you can start local server.

```
$ bundle exec rails s
```
Now you can open any browser and go to `http://127.0.0.1:3000` to use service
