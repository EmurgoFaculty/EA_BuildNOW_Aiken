
#!/bin/bash

# Variables
TX_IN="bbfa8c913c7f06fa0e8b05ef4ae801b779f784d42173e2ab3ad816de7c1687bc#0"               # Input UTXO (transaction hash#index)
TX_IN_AMOUNT=10000000000                # Amount in lovelaces in the input UTXO (10 tADA)
SEND_AMOUNT=1000000000                 # Each UTXO will send 1 tADA (1,000,000 lovelaces)
SEND_BACK=1000000000                 # Each UTXO will send 1 tADA (1,000,000 lovelaces)

# Addresses
ADDRESS_A=$(cat ../wallet/alice.addr)  # Replace with AddressA
ADDRESS_B=$(cat ../wallet/bob/bob.addr)     # Replace with AddressB
ADDRESS_C=$(cat ../wallet/test.addr)     # Replace with AddressB


# Keys
SIGNING_KEY_FILE="../wallet/bob/bob.skey"  # Replace with signing key file for AddressA

# Step 1: Build the raw transaction with 5 outputs to AddressB and the change back to AddressA
cardano-cli conway transaction build \
  --testnet-magic 2 \
  --tx-in "$TX_IN" \
  --tx-out "$ADDRESS_A+$SEND_AMOUNT" \
  --tx-out "$ADDRESS_A+$SEND_AMOUNT" \
  --tx-out "$ADDRESS_C+$SEND_BACK" \
  --tx-out "$ADDRESS_C+$SEND_BACK" \
  --tx-out "$ADDRESS_C+$SEND_BACK" \
  --change-address "$ADDRESS_B"  \
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
