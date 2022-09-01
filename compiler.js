let Web3 = require('web3');
let solc = require('solc');
let fs = require('fs');

let web3 = new Web3(new Web3.providers.HttpProvider('HTTP://127.0.0.1:7545'));

let file = fs.readFileSync('JellyBean.sol').toString();
console.log(file);

var input = {
    language: 'Solidity',
    sources: {
      'JellyBean.sol': {
        content: file
      }
    },
    settings: {
      outputSelection: {
        '*': {
          '*': ['*']
        }
      }
    }
  };

let output = JSON.parse(solc.compile(JSON.stringify(input)));
console.log(output);

ABI = output.contracts['JellyBean.sol']['JellyBean'].abi;
bytecode = output.contracts['JellyBean.sol']['JellyBean'].evm.bytecode.object;
console.log('ABI: ', ABI);
console.log('Bytecode: ', bytecode);