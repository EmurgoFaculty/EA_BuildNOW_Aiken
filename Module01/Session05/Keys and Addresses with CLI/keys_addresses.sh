   
mkdir alice
cd alice
cardano-cli address key-gen   --verification-key-file alice.vkey  --signing-key-file alice.skey
cardano-cli stake-address key-gen  --verification-key-file alicestake.vkey  --signing-key-file alicestake.skey
cardano-cli address build  --payment-verification-key-file alice.vkey --stake-verification-key-file alicestake.vkey  --out-file alice.addr --testnet-magic 2


mkdir bob
cd bob
cardano-cli address key-gen   --verification-key-file bob.vkey  --signing-key-file bob.skey
cardano-cli stake-address key-gen  --verification-key-file bobstake.vkey  --signing-key-file bobstake.skey
cardano-cli address build  --payment-verification-key-file bob.vkey --stake-verification-key-file bobstake.vkey  --out-file bob.addr --testnet-magic 2



cardano-cli query utxo --address addr_test1qqftdntvghftwx9qtwtps7gz0gs9wcc2kyw48tvdr0awcxrk3605metcv64m79eqn360l2r8fnjdr57sjnjwsteh29wq53jepe --testnet-magic 2
