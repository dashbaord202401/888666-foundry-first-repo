// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import { AggregatorV3Interface } from "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
      // This function will get the real amont of money that our contract needs so -> The price of ethereum in terms of USD
    function getPrice(AggregatorV3Interface priceFeed) internal view returns(uint256) {
        // Like we said to intercat with a contract we need its:
        // Addres -> 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI -> Some

        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price of ETH in tersm of USD
        return uint256(price * 1*10);
    }

    // This function will get the conversion rate based on the price from get price function
    function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed) internal view returns(uint256) {
        uint256 ethPrice = getPrice(priceFeed);
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        return ethAmountInUsd;
    }
}
