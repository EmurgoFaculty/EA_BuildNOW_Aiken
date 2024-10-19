
#!/bin/bash

# Variables
TX_IN="8d03fa265241415a42217d007a3cddb4ed9ce391092dc7ef88cd3a9bc27517ec#0"               # Input UTXO (transaction hash#index)
TX_INN="8d03fa265241415a42217d007a3cddb4ed9ce391092dc7ef88cd3a9bc27517ec#1"               # Input UTXO (transaction hash#index)


TX_IN_AMOUNT=2000000000                # Amount in lovelaces in the input UTXO (1000 tADA)
SEND_AMOUNT=1500000000                 # Each UTXO will send 1 tADA (1500 tADA )


# Addresses
ADDRESS_A=$(cat ../wallet/alice.addr)  # Replace with AddressA
ADDRESS_B=$(cat ../wallet/bob/bob.addr)     # Replace with AddressB


# Keys
SIGNING_KEY_FILE="../wallet/alice.skey"  # Replace with signing key file for AddressA

# Step 1: Build the raw transaction with 5 outputs to AddressB and the change back to AddressA
cardano-cli conway transaction build \
  --testnet-magic 2 \
  --tx-in "$TX_IN" \
  --tx-in "$TX_INN" \
  --tx-out "$ADDRESS_B+$SEND_AMOUNT" \
  --change-address "$ADDRESS_A"  \
  --out-file tx.raw

# Step 2: Sign the transaction
cardano-cli conway transaction sign \
  --tx-body-file tx.raw \
  --signing-key-file "$SIGNING_KEY_FILE" \
  --testnet-magic 2 \
  --out-file tx.signed

# Step 3: Submit the transaction
cardano-cli conway transaction submit \
  --testnet-magic 2 \
  --tx-file tx.signed \


echo "Transaction submitted successfully!"
