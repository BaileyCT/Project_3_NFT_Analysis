pragma solidity ^0.8.0;

//Import ERC1155 contract from Openzeppelin

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC1155/ERC1155.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract NFTContract is ERC1155, Ownable {
    
    uint256 public constant Squidward = 0;
    
    constructor() ERC1155("ipfs://QmXbuEbaKoo8JhyPzNetvT2aqdXE74zJSTYyWQYkP8pj6m/metadata/{id}.json") {
        _mint(msg.sender, 1, 1, "");
        _mint(msg.sender, 2, 1, "");
        _mint(msg.sender, 3, 1, "");
        _mint(msg.sender, 4, 1, "");
        _mint(msg.sender, 5, 1, "");
        _mint(msg.sender, 6, 1, "");
        _mint(msg.sender, 7, 1, "");
        _mint(msg.sender, 8, 1, "");
        _mint(msg.sender, 9, 1, "");
        _mint(msg.sender, 10, 1, "");
        _mint(msg.sender, 11, 1, "");
        _mint(msg.sender, 12, 1, "");
        _mint(msg.sender, 13, 1, "");
        _mint(msg.sender, 14, 1, "");
        _mint(msg.sender, 15, 1, "");
        _mint(msg.sender, 16, 1, "");
        _mint(msg.sender, 17, 1, "");
        _mint(msg.sender, 18, 1, "");
        _mint(msg.sender, 19, 1, "");
        _mint(msg.sender, 20, 1, "");
        _mint(msg.sender, 21, 1, "");
        _mint(msg.sender, 22, 1, "");
        _mint(msg.sender, 23, 1, "");
        _mint(msg.sender, 24, 1, "");
        _mint(msg.sender, 25, 1, "");
        _mint(msg.sender, 26, 1, "");
        _mint(msg.sender, 27, 1, "");
        _mint(msg.sender, 28, 1, "");
        _mint(msg.sender, 29, 1, "");
        _mint(msg.sender, 30, 1, "");
        
    }
    
    function mint(address account, uint256 id, uint256 amount) public onlyOwner {
        _mint(account, id, amount, "");   
    }
    
    function burn(address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account,id,amount);
    }
}