pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract MyNFT is ERC721 {
    using SafeMath for uint256;

    mapping(uint256 => address) private _tokenOwner;
    mapping(uint256 => string) private _tokenIPFSHash;

    constructor(
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) {}

    function mint(address to, uint256 tokenId, string memory ipfsHash) public {
        _setTokenIPFSHash(tokenId, ipfsHash);
        _tokenOwner[tokenId] = to;
        _mint(to, tokenId);
    }

    function ownerOf(
        uint256 tokenId
    ) public view virtual override returns (address) {
        return _tokenOwner[tokenId];
    }

    function tokenIPFSHash(
        uint256 tokenId
    ) public view returns (string memory) {
        return _tokenIPFSHash[tokenId];
    }

    function _setTokenIPFSHash(
        uint256 tokenId,
        string memory ipfsHash
    ) internal {
        _tokenIPFSHash[tokenId] = ipfsHash;
    }
}
