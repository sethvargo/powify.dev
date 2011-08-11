Powify.dev
==========

Welcome to powify.dev - the official web-management tool for Powify. This simple rails app provides a quick overview of your Pow server's config, status, and application health.

It is still in very early development.

Powify Installation
-------------------
`powify.dev` is designed to be installed using [powify](https://github.com/sethvargo/powify).

If you haven't already installed `powify`:

    gem install powify

Now just run:

    powify utils install

This will install `powify.dev`. Visit [http://powify.dev](http://powify.dev) on your local machine and you're all set!

Manual Installation
-------------------
`powify.dev` is designed to be installed using [powify](https://github.com/sethvargo/powify), but it's possible to install on it's own (it's just a Rails app)

Clone the master branch:

    git clone git@github.com:sethvargo/powify.dev powify

Find your `hostRoot` path. Run the command:

    curl localhost/config.json --silent --header host:pow

and use the `hostRoot` value.

Move the `powify.dev` app to the `hostRoot` path:

    mv powify [PATH_TO_HOSTROOT]

This will install `powify.dev`. Visit [http://powify.dev](http://powify.dev) on your local machine and you're all set!

Notes
-----
I named it `powify.dev` because `.dev` is the default URL extension for `Pow`. `powify.dev` still works with custom domain extensions, etc.