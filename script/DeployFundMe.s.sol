// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {FundMe} from "../src/FundMe.sol";
import {HelperConfig} from "./HelperConfig.s.sol";

contract DeployFundMe is Script {
    function run() external returns(FundMe) {
        // We do this before startBroadcast because anything that we do before it won't be a "real" transaction
        HelperConfig helperConfig = new HelperConfig();
        address ehtPriceFeedAddress = helperConfig.activeNetworkConfig();

        // Everything we do after startBroadcast will be a "real" transaction
        vm.startBroadcast();
        FundMe fundMe = new FundMe(ehtPriceFeedAddress);
        vm.stopBroadcast();
        return fundMe;
    }
}
