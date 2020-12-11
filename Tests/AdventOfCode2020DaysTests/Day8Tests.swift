import XCTest
@testable import AdventOfCode2020Days

final class Day8Tests: XCTestCase {
    let input = """
    nop +0
    acc +1
    jmp +4
    acc +3
    jmp -3
    acc -99
    acc +1
    jmp -4
    acc +6
    """

    func testAccumulatorBeforeInfiniteLoop() {
        var vm = VM.init(accumulator: 0, program: VM.interpretProgram(input: input))
        XCTAssertEqual(vm.accumulatorBeforeInfiniteLoop(), 5)
    }

    static var allTests = [
        ("testAccumulatorBeforeInfiniteLoop", testAccumulatorBeforeInfiniteLoop),
    ]
}
