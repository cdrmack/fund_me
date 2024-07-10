// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";

contract HelperConfig is Script {
    uint256 public constant ETH_SEPOLIA_CHAIN_ID = 11155111;

    NetworkConfig public activeNetworkConfig;

    struct NetworkConfig {
        address priceFeed; // ETC/USD price feed address
    }

    constructor() {
        if (block.chainid == ETH_SEPOLIA_CHAIN_ID) {
            activeNetworkConfig = getSepoliaConfig();
        } else {
            activeNetworkConfig = getAnvilConfig();
        }
    }

    function getSepoliaConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            priceFeed: 0x694AA1769357215DE4FAC081bf1f309aDC325306
        });
        return sepoliaConfig;
    }

    function getAnvilConfig() public pure returns (NetworkConfig memory) {
        // TODO
    }
}
