
#!/bin/bash

# Variables
TX_IN="1dc6e8db3b9f0798370f907250a1d3f689000b16194b4eaff1d275f924fb3f5b#0"               # Input UTXO (transaction hash#index)
TX_IN_AMOUNT=10000000                # Amount in lovelaces in the input UTXO (10 tADA)
SEND_AMOUNT=1000000                 # Each UTXO will send 1 tADA (1,000,000 lovelaces)
TOTAL_SEND_AMOUNT=$((SEND_AMOUNT * 5)) # Total 5 tADA to be sent
FEE=200000                            # Estimated transaction fee (adjust as needed)
CHANGE_AMOUNT=$((TX_IN_AMOUNT - TOTAL_SEND_AMOUNT - FEE)) # Calculate the change

# Addresses
ADDRESS_A=$(cat ../wallet/alice.addr)  # Replace with AddressA
ADDRESS_B=$(cat ../wallet/bob/bob.addr)     # Replace with AddressB

# Keys
SIGNING_KEY_FILE="../wallet/alice.skey"  # Replace with signing key file for AddressA

# Network parameters
NETWORK="--testnet-magic 2"  # Replace with the correct testnet magic

# Step 1: Build the raw transaction with 5 outputs to AddressB and the change back to AddressA
cardano-cli conway transaction build \
  --testnet-magic 2 \
  --tx-in "$TX_IN" \
  --tx-out "$ADDRESS_B+$SEND_AMOUNT" \
  --tx-out "$ADDRESS_B+$SEND_AMOUNT" \
  --tx-out "$ADDRESS_B+$SEND_AMOUNT" \
  --tx-out "$ADDRESS_B+$SEND_AMOUNT" \
  --tx-out "$ADDRESS_B+$SEND_AMOUNT" \
  --change-address "$ADDRESS_A"  \
  --out-file tx.raw

# Step 2: Sign the transaction
cardano-cli conway transaction sign \
  --tx-body-file tx.raw \
  --signing-key-file "$SIGNING_KEY_FILE" \
  $NETWORK \
  --out-file tx.signed

# Step 3: Submit the transaction
cardano-cli conway transaction submit \
  $NETWORK \
  --tx-file tx.signed \


echo "Transaction submitted successfully!"
