//SPDX-License-Identifier: MIT

pragma solidity ^0.8.4;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";



contract NFT is ERC721URIStorage{
    using Counters for Counters.Counter;
    Counters.Counter private _tokenids;
    address contractAddress;


    constructor(address marketplaceAddress) ERC721("Metaverse Tokens", "METT"){
        contractAddress = marketplaceAddress;
    }
    
    function createToken(string memory tokenURI) public returns(uint){
        //A funtion that will create the token and mint it
        
        _tokenids.increment();
        uint256 newItemid = _tokenids.current();
        _mint(msg.sender, newItemid);
        _setTokenURI(newItemid, tokenURI);
        setApprovalForAll(contractAddress, true);
        return newItemid;
    }
}