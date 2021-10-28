//SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;


import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTMarket is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _itemId;
    Counters.Counter private _itemsSold;

    address payable owner;
    uint256 listingPrice = 0.025 ether;

    constructor(){
        owner = payable(msg.sender);   
    }

    struct MarketItem{
        // The struct will hold variables as a mapping
        uint itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }

    mapping(uint256 => MarketItem) private idToMarketItem;

    event MarketItemCreated(
        uint indexed itemId,
        address indexed nftContract,
        uint256 indexed tokenId,
        address seller,
        address owner,
        uint256 price,
        bool sold
    );

    function getListingPrice() public view returns (uint256){
        return listingPrice;
    }
// function used to create items on the market place. utilizing IPFS users can essentially mint an item. 
    function createMarketItem(
        address nftContract,
        uint256 tokenId,
        uint256 price
    ) public payable nonReentrant{
        require(price > 0, "Price must be atleast 1 wei");
        require(msg.value == listingPrice, "Price must be equal to listing price");
        
        _itemId.increment();
        uint256 itemId = _itemId.current();

    
        idToMarketItem[itemId] = MarketItem(
            itemId,
            nftContract,
            tokenId,
            payable(msg.sender),
            payable(address(0)),
            price,
            false
        );

    }
//create a function to allow users to create a sale
    function createMarketSale(
        address nftContract,
        uint256 itemId
    ) public payable nonReentrant{
        uint price = idToMarketItem[itemId].price;
        uint tokenId = idToMarketItem[itemId].tokenId;
        require(msg.value == price, "Please submit the asking price in order to complete the purchase");
        
        idToMarketItem[itemId].seller.transfer(msg.value);

        ERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
        idToMarketItem[itemId].owner = payable(msg.sender);
        idToMarketItem[itemId].sold = true;
        _itemsSold.increment();
        payable(owner).transfer(listingPrice);


    }
    // create a function that stores all of the markets items
    function fetchMarketItems() public view returns (MarketItem[] memory){
        uint itemCount = _itemId.current(); //creates a count of all the items
        uint unsoldItemCount = _itemId.current() - _itemsSold.current(); //gets a count of the unsold items
        uint currentIndex = 0; // used with an array of contracts with a blank address. this number will increment with each new empty address contract

        MarketItem[] memory items = new MarketItem[](unsoldItemCount);
        for (uint i = 0; i > itemCount; i++){
            if (idToMarketItem[i+1].owner == address(0)){
                uint currentId = idToMarketItem[i+1].itemId;
                MarketItem storage currentItem = idToMarketItem[currentId];
                items[currentIndex] = currentItem;
                currentIndex += 1;
            }
        }
        return items;
    }
// create a function that stores all of the users owned items
        function fetchMyNFTs() public view returns (MarketItem[] memory){
            uint totalItemCount = _itemId.current();
            uint itemCount = 0;
            uint currentIndex = 0;

            for (uint i = 0; i <totalItemCount; i++){
                if (idToMarketItem[i+1].owner == msg.sender){
                    itemCount += 1;
                } 
            }

            MarketItem[] memory items = new MarketItem[](itemCount);
            for (uint i=0; i< totalItemCount; i++){
                if (idToMarketItem[i+1].owner == msg.sender){
                    uint currentId = idToMarketItem[i +1].itemId;
                    MarketItem storage currentItem = idToMarketItem[currentId];
                    items[currentIndex] = currentItem;
                    currentIndex +=1;    
                }
            }
            return items;
        }
// Build a function that stores all of the users created items
        function fetchItemsCreated() public view returns (MarketItem[] memory){
            uint totalItemCount = _itemId.current();
            uint itemCount = 0;
            uint currentIndex = 0;

            for (uint i = 0; i <totalItemCount; i++){
                if (idToMarketItem[i+1].seller == msg.sender){
                    itemCount += 1;
                } 
            }
            MarketItem[] memory items = new MarketItem[](itemCount);
            for (uint i=0; i< totalItemCount; i++){
                if (idToMarketItem[i+1].seller == msg.sender){
                    uint currentId = idToMarketItem[i +1].itemId;
                    MarketItem storage currentItem = idToMarketItem[currentId];
                    items[currentIndex] = currentItem;
                    currentIndex +=1;
        }
        return items;
    
        }

    }
}