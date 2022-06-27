#!/usr/bin/fish

function sol -d "Initialize a new Solidity project."
    set coinmarketcap_api_key $COINMARKETCAP_API_KEY
    set currency EUR
    set etherscan_api_key $ETHERSCAN_API_KEY
    set mainnet_url https://eth-mainnet.alchemyapi.io/v2/
    set network goerli
    set node_env dev
    set private_key $METAMASK_TESTNET_PRIVATE_KEY
    set public_key $METAMASK_TESTNET_PUBLIC_KEY
    set report_gas true
    set testnet_url https://eth-goerli.alchemyapi.io/v2/
    set token ETH

    if test (count $argv) -lt 2; or test $argv[1] = --help
        echo "Initialize a new Solidity project."
        echo "Usage: sol [name] [alchemy_api_key]"
    else
        set name $argv[1]
        set upper_name (echo $name | sed "s/\<.\|_./\U&/g")
        set alchemy_api_key $argv[2]
        git clone https://github.com/tun43p/solidity-template $name
        echo -e "NODE_ENV=$node_env\nCURRENCY=$currency\nTOKEN=$token\nPUBLIC_KEY=$public_key\nPRIVATE_KEY=$private_key\nNETWORK=$network\nMAINNET_URL=$mainnet_url\nTESTNET_URL=$testnet_url\nALCHEMY_API_KEY=$alchemy_api_key\nCOINMARKETCAPI_API_KEY=$coinmarketcap_api_key\nETHERSCAN_API_KEY=$etherscan_api_key\nREPORT_GAS=$report_gas" >$name/.env
        sed -i "s/solidity-template/$name/" $name/package.json
        sed -i "s/solidity-template/$name/" $name/README.md
        sed -i "s/Solidity Template/$upper_name/" $name/README.md
    end
end
