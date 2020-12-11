import XCTest
@testable import AdventOfCode2020Days

final class AdventOfCode2020DaysTests: XCTestCase {
    func testDay5Highest() {
        XCTAssertEqual(Day5.processBoardingPass(input: "FFFBBBFRRR").seat, 119)
        XCTAssertEqual(Day5.processBoardingPass(input: "BFFFBBFRRR").seat, 567)
        XCTAssertEqual(Day5.processBoardingPass(input: "BBFFBBFRLL").seat, 820)
    }
    func testDay5Col() {
        XCTAssertEqual(0, Day5.calculateCol("LLL"))
        XCTAssertEqual(2, Day5.calculateCol("LRL"))
        XCTAssertEqual(4, Day5.calculateCol("RLL"))
        XCTAssertEqual(5, Day5.calculateCol("RLR"))
        XCTAssertEqual(7, Day5.calculateCol("RRR"))
    }

    func testDay5Row() {
        XCTAssertEqual(14, Day5.calculateRow("FFFBBBF"))
        XCTAssertEqual(70, Day5.calculateRow("BFFFBBF"))
        XCTAssertEqual(102, Day5.calculateRow("BBFFBBF"))
    }

    static var allTests = [
        ("testDay5Col", testDay5Col),
    ]
}
