// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract Assembly {
    function yul_let() public pure returns(uint256 z){
        assembly {
            let x := 123
            z := 456
        }
    }

    function yul_if(uint256 x) public pure returns (uint256 z){
        assembly {
            if lt(x, 10) {z := 10}
        }
    }

    function yul_switch(uint256 x)public pure returns (uint256 z){
        assembly {
            switch x
            case 1 { z:=10 }
            case 2 { z:=20 }
            default { z:=0 }
        }
    }

    function yul_loop()public pure returns(uint256 z){
        assembly{
            for{let i :=0 } lt(i,10) { i:=add(i,1)} {
                z := add(z,1)
            }
        }
    }

    function yul_while_loop() public pure returns(uint256 z){
        assembly {
            let i := 0
            for {} lt(i, 5) {}{
                i := add(i, 1)
                z := add(z,1 )
            }
        }
    }

    function yul_revert(uint256 x) public  pure{
        assembly {
            if gt(x, 10) {revert(0,0)}
        }
    }
    function yul_add(uint256 x, uint256 y) public pure returns (uint256 z) {
        assembly {
            z := add(x, y)
            if lt(z, x) { revert(0, 0) }
        }
    }

    function yul_mul(uint256 x, uint256 y) public pure returns (uint256 z) {
        assembly {
            switch x
            case 0 { z := 0 }
            default {
                z := mul(x, y)
                if iszero(eq(div(z, x), y)) { revert(0, 0) }
            }
        }
    }

    function yul_fixed_point_round(uint256 x, uint256 b)
        public
        pure
        returns (uint256 z)
    {
        assembly {
            // b = 100
            // x = 90
            // z = 90 / 100 * 100 = 0, want z = 100
            // z := mul(div(x, b), b)

            let half := div(b, 2)
            z := add(x, half)
            z := mul(div(z, b), b)
            // x = 90
            // half = 50
            // z = 90 + 50 = 140
            // z = 140 / 100 * 100 = 100
        }
    }
}
