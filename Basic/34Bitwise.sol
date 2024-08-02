// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


contract Bitwiseops {
    function add(uint256 x, uint256 y) external pure returns (uint256){
        return x & y;
    }

    function or(uint256 x, uint256 y) external pure returns (uint256) {
        return x | y;
    }
    function xor(uint256 x, uint256 y) external pure returns (uint256) {
        return x ^ y;
    }
    function not(uint8 x) external pure returns (uint8) {
        return ~x;
    }
    function shiftLeft(uint256 x, uint256 bits)
        external
        pure
        returns (uint256)
    {
        return x << bits;
    }
    function shiftRight(uint256 x, uint256 bits)
        external
        pure
        returns (uint256)
    {
        return x >> bits;
    }
    function getLastNBits(uint256 x, uint256 n)
        external
        pure
        returns (uint256)
    {
        uint256 mask = (1 << n) - 1;
        return x & mask;
    }
    function getLastNBitsUsingMod(uint256 x, uint256 n)
        external
        pure
        returns (uint256)
    {
        // 1 << n = 2 ** n
        return x % (1 << n);
    }
    function mostSignificantBit(uint256 x) external pure returns (uint256) {
        uint256 i = 0;
        while ((x >>= 1) > 0) {
            ++i;
        }
        return i;
    }
    function getFirstNBits(uint256 x, uint256 n, uint256 len)
        external
        pure
        returns (uint256)
    {
        // Example
        // x        = 1110 = 14, n = 2, len = 4
        // mask     = 1100 = 12
        // x & mask = 1100 = 12
        uint256 mask = ((1 << n) - 1) << (len - n);
        return x & mask;
    }

    function getFirstNBits2(uint256 x, uint256 n, uint256 len)
        external
        pure
        returns (uint256)
    {
        x >>= (len-n);
        return x << (len-n);
    }
}
contract MostSignificantBitFunction {
    // Find most significant bit using binary search
    function mostSignificantBit(uint256 x)
        external
        pure
        returns (uint256 msb)
    {
        // x >= 2 ** 128
        if (x >= 0x100000000000000000000000000000000) {
            x >>= 128;
            msb += 128;
        }
        // x >= 2 ** 64
        if (x >= 0x10000000000000000) {
            x >>= 64;
            msb += 64;
        }
        // x >= 2 ** 32
        if (x >= 0x100000000) {
            x >>= 32;
            msb += 32;
        }
        // x >= 2 ** 16
        if (x >= 0x10000) {
            x >>= 16;
            msb += 16;
        }
        // x >= 2 ** 8
        if (x >= 0x100) {
            x >>= 8;
            msb += 8;
        }
        // x >= 2 ** 4
        if (x >= 0x10) {
            x >>= 4;
            msb += 4;
        }
        // x >= 2 ** 2
        if (x >= 0x4) {
            x >>= 2;
            msb += 2;
        }
        // x >= 2 ** 1
        if (x >= 0x2) msb += 1;
    }
}
 

contract MostSignificantBitAssembly {
    function mostSignificantBit(uint256 x)
        external
        pure
        returns (uint256 msb)
    {
        assembly {
            let f := shl(7, gt(x, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            // or can be replaced with add
            msb := or(msb, f)
        }
        assembly {
            let f := shl(6, gt(x, 0xFFFFFFFFFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(5, gt(x, 0xFFFFFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(4, gt(x, 0xFFFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(3, gt(x, 0xFF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(2, gt(x, 0xF))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := shl(1, gt(x, 0x3))
            x := shr(f, x)
            msb := or(msb, f)
        }
        assembly {
            let f := gt(x, 0x1)
            msb := or(msb, f)
        }
    }
}
