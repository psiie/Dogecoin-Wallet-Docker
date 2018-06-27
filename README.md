# Dogecoin Wallet Docker
I have had a difficult time finding a working docker image with dogecoind installed in it. So I made it myself. Enjoy <3

*Note*: Everything in this repo is set to run testnet. Not actual Dogecoin network.

# Dogecoin-1.14alpha
This is an alpha build. Not recommended for applications outside of development.

# Dogecoin-Core
This is what you want. Make sure you have docker installed. Edit dogecoin.conf to your liking (must change the rpcpassword!). Then execute `./build.sh` followed by `./run.sh`. Be sure to stop dogecoind with `./stop.sh` to prevent corruption of the wallet/blockchain data.

# Bootstrap
Don't want to wait for the entire Dogecoin-testnet3 blockchain syncs? Speed up the process with this bootstrap. https://drive.google.com/file/d/1cgp0gSV0m1xks4PldIEJQh04BU6fC_58/view?usp=sharing

Dumped as of June 27th 2018.