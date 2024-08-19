// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import { IGovernancePowerDelegationToken } from "./IGovernancePowerDelegationToken.sol";

contract SaucyBlockDelegatePlatform {
    // ========================= this is saucyBlock Address!!! ===================
    address constant public saucyBlock = 0x08651EeE3b78254653062BA89035b8F8AdF924CE;
    // ============================================================================

    address constant public AAVE = 0x7Fc66500c84A76Ad7e9c93437bFc5Ac33E2DDaE9;
    address constant public STKAAVE = 0x4da27a545c0c5B758a6BA100e3a049001de870f5;
    address constant public ATOKEN = 0xA700b4eB416Be35b2911fd5Dee80678ff64fF6C9;

    modifier validToken(address tokenAddress) {
        require(
            tokenAddress == AAVE || tokenAddress == STKAAVE || tokenAddress == ATOKEN,
            "Wrong token address"
        );
        _;
    }

    function delegateByType(
        address tokenAddress,
        address delegator,
        IGovernancePowerDelegationToken.GovernancePowerType delegationType, 
        uint256 deadline, uint8 v, bytes32 r, bytes32 s
    ) external validToken(tokenAddress) {
        IGovernancePowerDelegationToken(tokenAddress).metaDelegateByType(
            delegator, saucyBlock, delegationType, deadline, v, r, s
        );
    }

    function delegate(
        address tokenAddress,
        address delegator,
        uint256 deadline, uint8 v, bytes32 r, bytes32 s
    ) external validToken(tokenAddress) {
        IGovernancePowerDelegationToken(tokenAddress).metaDelegate(
            delegator, saucyBlock, deadline, v, r, s
        );
    }
}