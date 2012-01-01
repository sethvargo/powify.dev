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

License
-------
Copyright (c) 2012 Seth Vargo

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.