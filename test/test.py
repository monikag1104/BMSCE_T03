# SPDX-FileCopyrightText: © 2024
# SPDX-License-Identifier: Apache-2.0

import cocotb
from cocotb.triggers import Timer


@cocotb.test()
async def test_adder_basic(dut):
    """Basic tests for the 8-bit Parallel Adder"""

    dut._log.info("Start Adder Test")

    # Test 1: 12 + 7 + 0 = 19
    dut.x.value = 12
    dut.y.value = 7
    dut.cin.value = 0
    await Timer(1, units="ns")
    assert dut.sum.value == 19 and dut.cout.value == 0, f"Test1 failed: got {int(dut.sum.value)}"

    # Test 2: 240 + 15 + 1 = 256 -> sum=0, cout=1
    dut.x.value = 240
    dut.y.value = 15
    dut.cin.value = 1
    await Timer(1, units="ns")
    assert dut.sum.value == 0 and dut.cout.value == 1, f"Test2 failed: got {int(dut.sum.value)}, {int(dut.cout.value)}"

    # Test 3: Alternating pattern
    dut.x.value = 0b10101010
    dut.y.value = 0b01010101
    dut.cin.value = 0
    await Timer(1, units="ns")
    assert dut.sum.value == 255 and dut.cout.value == 0, f"Test3 failed: got {int(dut.sum.value)}"

    # Test 4: Overflow case (255 + 1)
    dut.x.value = 255
    dut.y.value = 1
    dut.cin.value = 0
    await Timer(1, units="ns")
    assert dut.sum.value == 0 and dut.cout.value == 1, f"Test4 failed: got {int(dut.sum.value)}"

    dut._log.info("All tests passed ✅")
