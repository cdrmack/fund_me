// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {FundMe} from "../src/FundMe.sol";
import {DeployFundMe} from "../script/DeployFundMe.s.sol";

contract FundMeTest is Test {
    FundMe fundMe;

    function setUp() external {
        DeployFundMe deplyFundMe = new DeployFundMe();
        fundMe = deplyFundMe.run();
    }

    function testMinimumDollarIsFive() public view {
        assertEq(fundMe.MINIMUM_USD(), 5e18);
    }

    function testOwnerIsMsgSender() public view {
        assertEq(fundMe.contractOwner(), msg.sender);
    }

    function testVersionIsFour() public view {
        uint256 version = fundMe.get_version();
        assertEq(version, 4);
    }
}
