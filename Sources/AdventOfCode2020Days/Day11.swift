//
//  Day11.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation
import Heap

public struct Day11: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [Self.terminalSeatsOccupiedPart1,
                                          Self.terminalSeatsOccupiedPart2],
                                  errorMessage: "no seats could be found")
    }

    static func terminalSeatsOccupiedPart1(input: String) -> Int? {
        var lobby = Self.readInput(input)
        simulate(lobby: &lobby,
                 countNeighbors: Self.countDirectNeighbors,
                 maxNeighbors: 4)
        var occupied = 0
        for row in lobby {
            for chair in row {
                if chair == true {
                    occupied += 1
                }
            }
        }
        return occupied != 0 ? occupied : nil
    }

    static func terminalSeatsOccupiedPart2(input: String) -> Int? {
        var lobby = Self.readInput(input)
        simulate(lobby: &lobby,
                 countNeighbors: Self.countSightNeighbors,
                 maxNeighbors: 5)
        var occupied = 0
        for row in lobby {
            for chair in row {
                if chair == true {
                    occupied += 1
                }
            }
        }
        return occupied != 0 ? occupied : nil
    }

    static func print(lobby: [[Bool?]]) {
        for row in lobby {
            var output = ""
            for chair in row {
                if chair == nil {
                    output.append(".")
                } else if chair! {
                    output.append("#")
                } else {
                    output.append("L")
                }
            }
            Swift.print(output)
        }
        Swift.print("\n")
    }

    static func simulate(lobby: inout [[Bool?]],
                         countNeighbors: ((x: Int, y: Int), [[Bool?]]) -> Int,
                         maxNeighbors: Int) {
        let snapshot = lobby
        var changed = false
        for y in 0..<lobby.count {
            for x in 0..<lobby[y].count {
                let neighbors = countNeighbors((x: x, y: y), snapshot)
                if neighbors == 0 {
                    if lobby[y][x] != nil {
                        if !lobby[y][x]! {
                            changed = true
                            lobby[y][x] = true
                        }
                    }
                }
                if neighbors >= maxNeighbors {
                    if lobby[y][x] != nil {
                        if lobby[y][x]! {
                            changed = true
                            lobby[y][x] = false
                        }
                    }
                }
            }
        }
        if changed {
            simulate(lobby: &lobby, countNeighbors: countNeighbors, maxNeighbors: maxNeighbors)
        }
    }

    static func countDirectNeighbors(at: (x: Int, y: Int), in lobby: [[Bool?]]) -> Int {
        var neighbors = 0
        if at.y > 0 {
            // top left
            if at.x > 0 {
                if lobby[at.y-1][at.x-1] != nil {
                    neighbors += lobby[at.y-1][at.x-1]! ? 1 : 0
                }
            }
            // top middle
            if lobby[at.y-1][at.x] != nil {
                neighbors += lobby[at.y-1][at.x]! ? 1 : 0
            }
            // top right
            if (at.x + 1) < lobby[at.y-1].count {
                if lobby[at.y-1][at.x + 1] != nil {
                    neighbors += lobby[at.y-1][at.x + 1]! ? 1 : 0
                }
            }
        }
        // middle left
        if at.x > 0 {
            if lobby[at.y][at.x-1] != nil {
                neighbors += lobby[at.y][at.x-1]! ? 1 : 0
            }
        }
        // middle right
        if (at.x + 1) < lobby[at.y].count {
            if lobby[at.y][at.x + 1] != nil {
                neighbors += lobby[at.y][at.x + 1]! ? 1 : 0
            }
        }
        if (at.y + 1) < lobby.count {
            // bottom left
            if at.x > 0 {
                if lobby[at.y + 1][at.x - 1] != nil {
                    neighbors += lobby[at.y + 1][at.x - 1]! ? 1 : 0
                }
            }
            // bottom middle
            if lobby[at.y + 1][at.x] != nil {
                neighbors += lobby[at.y + 1][at.x]! ? 1 : 0
            }
            // bottom right
            if (at.x + 1) < lobby[at.y + 1].count {
                if lobby[at.y + 1][at.x + 1] != nil {
                    neighbors += lobby[at.y + 1][at.x + 1]! ? 1 : 0
                }
            }
        }
        return neighbors
    }

    static func countSightNeighbors(at: (x: Int, y: Int), in lobby: [[Bool?]]) -> Int {
        var neighbors = 0
        // top left
        var y = at.y - 1
        var x = at.x - 1
        while x >= 0 && y >= 0 {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            y -= 1
            x -= 1
        }
        // top middle
        y = at.y - 1
        x = at.x
        while y >= 0 {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            y -= 1
        }
        // top right
        y = at.y - 1
        x = at.x + 1
        while y >= 0 && x < lobby[y].count {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            y -= 1
            x += 1
        }
        // middle left
        y = at.y
        x = at.x - 1
        while x >= 0 {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            x -= 1
        }
        // middle right
        y = at.y
        x = at.x + 1
        while x < lobby[y].count {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            x += 1
        }
        // bottom left
        y = at.y + 1
        x = at.x - 1
        while x >= 0 && y < lobby.count {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            y += 1
            x -= 1
        }
        // bottom middle
        y = at.y + 1
        x = at.x
        while y < lobby.count {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            y += 1
        }
        // bottom right
        y = at.y + 1
        x = at.x + 1
        while y < lobby.count && x < lobby[y].count {
            if lobby[y][x] != nil {
                if lobby[y][x]! {
                    neighbors += 1
                }
                break
            }
            y += 1
            x += 1
        }

        return neighbors
    }


    static func readInput(_ input: String) -> [[Bool?]]{
        var output: [[Bool?]] = []
        input.enumerateLines { line, _ in
            output.append([])
            line.forEach { char in
                var value: Bool? = nil
                if char == "L" {
                    value = false
                } else if char == "#" {
                    value = true
                }
                output[output.count-1].append(value)
            }
        }
        return output
    }
}
