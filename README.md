# Sandbox for Maynard's scripts

## Configuration

### Ruby
#####Upgrade Ruby - Make sure that 'ruby' & 'gem' is 2.0 before installing bundler.
    $ brew install ruby
    
#####Reinstall Bundler
    $ gem uninstall bundler
    $ gem install bundler
    
### PhantomJS
#### Mac OS/X
    $ brew install phantomjs

### FreeTDS
#### Mac OS/X
    $ brew install tinydns

#### Linux
    $ yum install freetds
    
## Running
#### Set Environment : 'stage', 'uat', 'production'
    $ . environment-name
#### Run
    $ make clean
    $ make install
    $ make test-smoke
