import XCTest
@testable import AdventOfCode2020Days

final class Day12Tests: XCTestCase {
    let input = """
    F10
    N3
    F7
    R90
    F11
    """

    func testManhattanDistanceBasicShip() {
        XCTAssertEqual(Day12.manhattanDistanceBasicShip(input: input), 25)
    }

    func testManhattanDistanceWaypointShip() {
        XCTAssertEqual(Day12.manhattanDistanceWaypointShip(input: input), 286)
    }

    static var allTests = [
        ("testManhattanDistanceBasicShip", testManhattanDistanceBasicShip),
        ("testManhattanDistanceWaypointShip", testManhattanDistanceWaypointShip),
    ]
}
