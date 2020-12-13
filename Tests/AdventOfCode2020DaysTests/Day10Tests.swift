import XCTest
@testable import AdventOfCode2020Days

final class Day10Tests: XCTestCase {
    let input1 = """
    16
    10
    15
    5
    1
    11
    7
    19
    6
    12
    4
    """
    let input2 = """
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
        XCTAssertEqual(Day10.allAdaptersJoltDifferences(input: input1), 35)
        XCTAssertEqual(Day10.allAdaptersJoltDifferences(input: input2), 220)
    }

    func testTotalCombinations() {
        XCTAssertEqual(Day10.combinationsTotal(input: input1), 8)
        XCTAssertEqual(Day10.combinationsTotal(input: input2), 19208)
    }

    static var allTests = [
        ("testTotalCombinations", testTotalCombinations),
        ("testAllAdaptersJoltDifferences", testAllAdaptersJoltDifferences),
    ]
}
