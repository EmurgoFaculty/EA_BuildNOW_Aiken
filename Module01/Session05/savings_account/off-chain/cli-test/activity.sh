utxoin="39834ace4e0592606499d37f13b86c000e38b4a6edf48b0a3a2d66244f7635d3#1"
address=$(cat ../wallet/bob/bob.addr) 
output="700000000"

cardano-cli conway transaction build \
  --testnet-magic 2 \
  --tx-in $utxoin \
  --tx-out $address+$output \
  --change-address $(cat ../wallet/alice.addr)  \
  --out-file deposit.unsigned

cardano-cli conway transaction sign \
    --tx-body-file deposit.unsigned \
    --signing-key-file ../wallet/alice.skey \
    --testnet-magic 2 \
    --out-file deposit.signed

cardano-cli conway transaction submit \
    --testnet-magic 2 \
    --tx-file deposit.signed