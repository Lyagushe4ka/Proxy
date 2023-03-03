// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/SimpleMath.sol";
import "src/Operate.sol";
import "src/Operate2.sol";

contract SimpleMathTest is Test {
    SimpleMath public simple;
    IOperate public operate;
    IOperate public operate2;

    function setUp() external {
        operate = IOperate(new Operate());
        operate2 = IOperate(new Operate2());
        simple = new SimpleMath(operate);
    }

    function testView() external {
        simple.setA(3);
        assertEq(int256(simple.a()), 3);

        simple.setB(2);
        assertEq(int256(simple.b()), 2);

        assertEq(int256(simple.operate()), 1);

        simple.multiply();
        assertEq(int256(simple.a()), 9);

        simple.changeOper(operate2);
        assertEq(int256(simple.operate()), 12);

        simple.multiply();
        assertEq(int256(simple.a()), 18);
    }
}