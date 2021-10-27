let fs = require("fs");
let axios = require("axios");

let ipfsArray = [];
let promises = [];

for (let i = 1; i < 31; i++) {
    let paddedHex = ("0000000000000000000000000000000000000000000000000000000000000000" + i.toString(16)).substr("-64");    
    ipfsArray.push({
                path: `metadata/${paddedHex}.json`,
                content: {
                    image: `ipfs://QmYzs3MPH94AzpqTr2HymWMkKZtGL8WPPPo1QLYcrXDURA/images/${i}.png`,
                    name: `Squidward #${i}`,
                    description: "NFT for Project 3 FinTech"
                }  
    })
}
axios.post("https://deep-index.moralis.io/api/v2/ipfs/uploadFolder", 
   ipfsArray,
   {
        headers: {
            "X_API_KEY": "AaAxyOGv1UOarzfeJo1wWbIsewzjz6NXQ1fCcvlbete31xAr9NLKX4ZhxSHRI4xY",
            "Content_Type": "application/json",
            "accept": "application/json"
        }
    }
).then( (res) =>{
    console.log(res.data);
})
.catch ( (error) => {
    console.log(error)
})
