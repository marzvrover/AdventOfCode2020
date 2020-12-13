import XCTest
@testable import AdventOfCode2020Days

final class Day11Tests: XCTestCase {
    let input = """
    L.LL.LL.LL
    LLLLLLL.LL
    L.L.L..L..
    LLLL.LL.LL
    L.LL.LL.LL
    L.LLLLL.LL
    ..L.L.....
    LLLLLLLLLL
    L.LLLLLL.L
    L.LLLLL.LL
    """

    func testTerminalSeatsOccupiedPart1() {
        XCTAssertEqual(Day11.terminalSeatsOccupiedPart1(input: input), 37)
    }

    func testTerminalSeatsOccupiedPart2() {
        XCTAssertEqual(Day11.terminalSeatsOccupiedPart2(input: input), 26)
    }
    
    func testCountSightNeighbors() {
        var lobby = Day11.readInput(
            """
            .......#.
            ...#.....
            .#.......
            .........
            ..#L....#
            ....#....
            .........
            #........
            ...#.....
            """
        )
        XCTAssertEqual(Day11.countSightNeighbors(at: (x: 3, y: 4), in: lobby), 8)
        lobby = Day11.readInput(
            """
            .............
            .L.L.#.#.#.#.
            .............
            """
        )
        XCTAssertEqual(Day11.countSightNeighbors(at: (x: 0, y: 0), in: lobby), 0)
        lobby = Day11.readInput(
            """
            #.##.##.##
            #######.##
            #.#.#..#..
            ####.##.##
            #.##.##.##
            #.#####.##
            ..#.#.....
            ##########
            #.######.#
            #.#####.##
            """
        )
        XCTAssertEqual(Day11.countSightNeighbors(at: (x: 0, y: 1), in: lobby), 4)

    }

    static var allTests = [
        ("testTerminalSeatsOccupiedPart1", testTerminalSeatsOccupiedPart1),
        ("testTerminalSeatsOccupiedPart2", testTerminalSeatsOccupiedPart2),
    ]
}
