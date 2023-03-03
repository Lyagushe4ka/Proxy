// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "src/IOperate.sol";

contract SimpleMath {
    int256 gap;
    IOperate oper;
   
   constructor(IOperate _oper) {
    oper = _oper;
   }

    function changeOper(IOperate _oper) external {
        oper = _oper;
    }

    function a() external view returns(int64) {
        (bool success, bytes memory returnData ) = address(oper).staticcall(abi.encodeWithSignature("a()"));
        require(success == true);
        return abi.decode(returnData, (int64));
    }

    function b() external view returns(int64) {
        (bool success, bytes memory returnData ) = address(oper).staticcall(abi.encodeWithSignature("b()"));
        require(success == true);
        return abi.decode(returnData, (int64));
    }

    function setA(int64 _a) external {
        (bool success , ) = address(oper).delegatecall(abi.encodeWithSignature("setA(int64)", _a));
        require(success == true);
    }

    function setB(int64 _b) external {
        (bool success , ) = address(oper).delegatecall(abi.encodeWithSignature("setB(int64)", _b));
        require(success == true);
    }



    function multiply() external {
        (bool success , ) = address(oper).delegatecall(abi.encodeWithSignature("multiply()"));
        require(success == true);
    }

    function operate() external view returns(int64) {
        (bool success, bytes memory returnData) = address(oper).staticcall(abi.encodeWithSignature("operation()"));
        require(success == true);
        return abi.decode(returnData, (int64));
    }
}