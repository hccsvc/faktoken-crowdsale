# FakToken - ERC223 Sample Token

FakToken is an ERC223 standard token. It takes care of the vulnerabilities that ERC20 token currently possess. Solidity was utilized in building the smart contract, Truffle framework was also utilized for testing and deployment of the smart contract. The token is deployed to Rinkeby testnet

## Installation Guide
Install the truffle framework globally like so - `npm install truffle -g`
Clone this github repository - `git clone https://github.com/johnchuks/faktoken-crowdsale.git`
cd into `faktoken-crowdsale`
To compile run `truffle compile`.
To migrate and deploy the smart contract run `truffle migrate --reset`
Install Ganache. It provides 10 test account addresses that can used to test the smart contract.

## Testing

To get some `FakToken` deployed to the Rinkeby test net, 
 - Download the MetaMask chrome or firefox extension and follow the steps.
 - Ensure tocreate an ethereum node account on the [Rinkeby testnet](https://www.rinkeby.io/) using Metamask.
 - You can get some fake ether for the newly created account from [Rinkeby faucet](https://www.rinkeby.io/#faucet). Follow the steps to get credited.
 - Add the `FakToken` to your account using Metamask.
 - Send some `ether` to the `FakToken address - 0x21d3ba3d7e3b36120406609afc4673ffd00628d6` and receive some `Fak` tokens in return.


