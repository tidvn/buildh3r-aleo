#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkp7amLaN58wjZazheiUMTcAbhYGXqAj8VrBjZRpW2pjTeW
ADDRESS=aleo1jcrjwaufks6shvpjplt0keg5y7x8mpn26fw4fz0rtkp83kkvquqqr45s3s
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run finish "{
  owner: aleo1jcrjwaufks6shvpjplt0keg5y7x8mpn26fw4fz0rtkp83kkvquqqr45s3s.private,
  bidder: aleo1ejjy4pdudkutzumk8sh3ptkm3x89dz0y556ylqfxf5hxf9xmsgfq3800sq.private,
  amount: 90u64.private,
  is_winner: false.private,
  _nonce: 3489102125813186422474413583515595908915050663088672971994374445190125740308group.public
}"