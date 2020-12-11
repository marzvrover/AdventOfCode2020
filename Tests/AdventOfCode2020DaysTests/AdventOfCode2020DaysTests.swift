import XCTest
@testable import AdventOfCode2020Days

final class AdventOfCode2020DaysTests: XCTestCase {
    /*
     BFFFBBFRRR: row 70, column 7, seat ID 567.
     FFFBBBFRRR: row 14, column 7, seat ID 119.
     BBFFBBFRLL: row 102, column 4, seat ID 820.
     */
    func testDay5Col() {
        XCTAssertEqual(7, Day5.calculateCol("RRR"))
    }

    static var allTests = [
        ("testDay5Col", testDay5Col),
    ]
}
