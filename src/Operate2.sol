// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "src/IOperate.sol";

contract Operate2 is IOperate {
    int64 public a;
    int64 public b;

    function setA(int64 _a) external override {
        a = _a;
    }

    function setB(int64 _b) external override {
        b = _b;
    }

    function multiply() external override {
        a = a * 2;
        b = b * 2;
    }

    function operation() external view override returns(int64) {
        return 2 * a - b;
    }
}