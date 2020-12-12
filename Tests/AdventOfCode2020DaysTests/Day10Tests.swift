import XCTest
@testable import AdventOfCode2020Days

final class Day10Tests: XCTestCase {
    let input = """
    28
    33
    18
    42
    31
    14
    46
    20
    48
    47
    24
    23
    49
    45
    19
    38
    39
    11
    1
    32
    25
    35
    8
    17
    7
    9
    4
    2
    34
    10
    3
    """

    func testAllAdaptersJoltDifferences() {
        XCTAssertEqual(Day10.allAdaptersJoltDifferences(input: input), 220)
    }

    static var allTests = [
        ("testAllAdaptersJoltDifferences", testAllAdaptersJoltDifferences),
    ]
}
