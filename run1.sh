#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
We will be playing the role of three parties.

The private key and address of the first bidder.
private_key: APrivateKey1zkp3kBMifEiBSSng1qvckBaX8jKHrhZVhCwpaaDddYeoDGL
address: aleo1xwtwnkulcxh4ehuj50zdytwxzecx9echrqn3r6zy96hq5tuvzu9qk7cgx7

The private key and address of the second bidder.
private_key: APrivateKey1zkp4UFdGR1ciP19ocBL5CWjdntGPYG2PQBCEsbjqBz6ehhc
address: aleo1ejjy4pdudkutzumk8sh3ptkm3x89dz0y556ylqfxf5hxf9xmsgfq3800sq

The private key and address of the auctioneer.
private_key: APrivateKey1zkp7amLaN58wjZazheiUMTcAbhYGXqAj8VrBjZRpW2pjTeW
address: aleo1jcrjwaufks6shvpjplt0keg5y7x8mpn26fw4fz0rtkp83kkvquqqr45s3s
"

echo "
Let's start an auction!

###############################################################################
########                                                               ########
########           Step 0: Initialize a new 2-party auction            ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |         |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

# echo "
# Let's take the role of the first bidder - we'll swap in the private key and address of the first bidder to .env.

# We're going to run the transition function "place_bid", slotting in the first bidder's public address and the amount that is being bid. The inputs are the user's public address and the amount being bid.

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp3kBMifEiBSSng1qvckBaX8jKHrhZVhCwpaaDddYeoDGL
ADDRESS=aleo1xwtwnkulcxh4ehuj50zdytwxzecx9echrqn3r6zy96hq5tuvzu9qk7cgx7
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run place_bid $ADDRESS 40u64


echo "
###############################################################################
########                                                               ########
########         Step 1: The first bidder places a bid of 40           ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |   40    |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

#

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp4UFdGR1ciP19ocBL5CWjdntGPYG2PQBCEsbjqBz6ehhc
ADDRESS=aleo1ejjy4pdudkutzumk8sh3ptkm3x89dz0y556ylqfxf5hxf9xmsgfq3800sq
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

# Have the second bidder place a bid of 90.
leo run place_bid $ADDRESS 90u64

echo "
###############################################################################
########                                                               ########
########          Step 2: The second bidder places a bid of 90         ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |   40    |   90    |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"
