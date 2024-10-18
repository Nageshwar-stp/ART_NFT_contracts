// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract SimpleNFT is ERC721, Ownable {
    uint256 private _currentTokenId;
    string private _baseTokenURI;
    uint256 public maxSupply;
    uint256 public totalSupply;

    constructor(
        string memory baseURI,
        string memory name,
        string memory symbol
    ) ERC721(name, symbol) Ownable(msg.sender) {
        _baseTokenURI = baseURI;
        _currentTokenId = 0; 
        maxSupply = 2;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return _baseTokenURI;
    }

    function mintNFT(address to) public onlyOwner {
        require(totalSupply < maxSupply, "Not more minting allowed!");
        _safeMint(to, _currentTokenId);
        _currentTokenId += 1;  
        totalSupply += 1;
    }
}
