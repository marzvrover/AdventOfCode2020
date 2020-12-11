import XCTest
@testable import AdventOfCode2020Days

final class Day9Tests: XCTestCase {
    let input = """
    35
    20
    15
    25
    47
    40
    62
    55
    65
    95
    102
    117
    150
    182
    127
    219
    299
    277
    309
    576
    """

    func testFirstNumberException() {
        XCTAssertEqual(Day9.firstNumberException(input: input, offset: 5), 127)
    }
    
    func testContinousSum() {
        XCTAssertEqual(Day9.continousSum(input: input, offset: 5), 62)
    }

    static var allTests = [
        ("testFirstNumberException", testFirstNumberException),
    ]
}
