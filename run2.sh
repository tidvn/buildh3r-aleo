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

leo run resolve "{
  owner: aleo1jcrjwaufks6shvpjplt0keg5y7x8mpn26fw4fz0rtkp83kkvquqqr45s3s.private,
  bidder: aleo1xwtwnkulcxh4ehuj50zdytwxzecx9echrqn3r6zy96hq5tuvzu9qk7cgx7.private,
  amount: 40u64.private,
  is_winner: false.private,
  _nonce: 7817128213643086180551949894358663240380203515624363730458478989774032616345group.public
}" "{
  owner: aleo1jcrjwaufks6shvpjplt0keg5y7x8mpn26fw4fz0rtkp83kkvquqqr45s3s.private,
  bidder: aleo1ejjy4pdudkutzumk8sh3ptkm3x89dz0y556ylqfxf5hxf9xmsgfq3800sq.private,
  amount: 90u64.private,
  is_winner: false.private,
  _nonce: 1878516289208761783552320073227247985859769553081426392105685884774937028144group.public
}"