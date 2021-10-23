let fs = require("fs");
let axios = require("axios");

let ipfsArray = [];
let promises = [];

for (let i = 1; i < 31; i++) {

    promises.push(new Promise( (res, rej) => {
        fs.readFile(`${__dirname}/export/${i}.png`, (err, data) => {
            ipfsArray.push({
                path: `images/${i}.png`,
                content: data.toString("base64")
            })
            res();
        })
    }))
}
Promise.all(promises).then( () => {
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
})