bitcoin-wallet
# Unofficial Bitcoin core wallet GUI for docker

Unofficial [bitcoin core](http://www.bitcoincore.org/) wallet GUI docker image to be run standalone or inside a browser window using [Xpra](https://www.xpra.org/).

Having the wallet available as docker container has some advantages like:

* Run the wallet GUI on a remote server inside a web browser window.
* Run the wallet GUI locally without installing package dependencies.
* Easier updating when new versions are available.
* Run only the daemon on a remote server, and avoid the long blockchain sync waits each time the blockchain daemon is started in your laptop.

## Build instructions

We use `docker-compose` to build the images. Clone this repository and then:

    cd docker-bitcoin-wallet
    sudo docker-compose -f docker-compose-dev.yml build

## How to run the Wallet

The wallet can be run in two ways:

* As a standalone X11 application
* Inside a web browser window using [Xpra](https://www.xpra.org/).

### Standalone wallet

The `docker-compose` file mounts your X11 session's socket (/tmp/.X11-unix) so the container can connect back to your X server. To start the wallet with `docker-compose`:

    sudo docker-compose -p bitcoin-wallet up

To start the wallet in production mode the the `-d` parameter to the previous
command:

    sudo docker-compose -p bitcoin-wallet up -d

You can see the container logs with this command:

  sudo docker-compose -p bitcoin-wallet logs -f

After the container finish starting up the wallet will show up in your
screen.

### Web view wallet

This is useful to run the wallet (and leave it running if you want) on a remote server and avoid wasting huge amounts of space locally holding the blockchain copy. I run it on a Synology NAS, which compared to my laptop it has tons of spare space and is always on and connected to the Internet.

To run the wallet inside a web browser you need to define the environment variable `ENABLE_WEB_VIEW=yes`. Then start the wallet with `docker-compose` as before:

    sudo docker-compose -p bitcoin-wallet up

After some minutes the wallet will be available in http://[host]:10000, were host is the server name or IP address of the server running the wallet container.

![alt text]( "Wallet running on a web browser")

You can change the port using the environment variable `WEB_VIEW_PORT`.

**Note**: Firefox is recommended, I have had issues with chrome when repainting the browser screen.

## Debugging
To enable debug output, set the environment variable `DEBUG=yes`.
