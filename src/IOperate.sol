// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IOperate {
    function operation() external view returns(int64);
    
    function multiply() external;

    function a() external view returns(int64);

    function b() external view returns(int64);

    function setA(int64 _a) external;
    
    function setB(int64 _b) external;
}