pragma solidity ^0.8.4;

contract SupplyChain {
    address public owner;

    struct Product {
        string name;
        address owner;
    }

    mapping(uint => Product) public products;
    uint public productCount;

    constructor() {
        owner = msg.sender;
    }

    function registerProduct(string memory name) public {
        Product memory newProduct = Product(name, msg.sender);
        productCount++;
        products[productCount] = newProduct;
    }

    function transferProduct(uint id, address newOwner) public {
        require(
            products[id].owner == msg.sender,
            "You are not the owner of this product"
        );
        products[id].owner = newOwner;
    }

    function getProductOwner(uint id) public view returns (address) {
        return products[id].owner;
    }
}
