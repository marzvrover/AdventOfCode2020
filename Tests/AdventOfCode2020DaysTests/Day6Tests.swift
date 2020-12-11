import XCTest
@testable import AdventOfCode2020Days

final class Day6Tests: XCTestCase {
    func testCountYeses() {
        XCTAssertEqual(Day6.countGroupYeses(input: "abcabc"), 3)
        XCTAssertEqual(Day6.countGroupYeses(input: "ab\nca\nbc"), 3)
    }

    func testCountCompleteYeses() {
        let i1 = """
        xeu
        uoe
        tnpeox
        e
        vrdzwglecbk
        """
        XCTAssertEqual(Day6.countCompleteGroupYeses(input: "a\na\nab"), 1)
        XCTAssertEqual(Day6.countCompleteGroupYeses(input: i1), 1)
    }

    static var allTests = [
        ("testCountYeses", testCountYeses),
        ("testCountCompleteYeses", testCountCompleteYeses),
    ]
}
