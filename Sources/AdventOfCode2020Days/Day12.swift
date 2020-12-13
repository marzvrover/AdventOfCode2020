//
//  Day12.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation
import Heap

public struct Day12: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [Self.manhattanDistanceBasicShip,
                                          Self.manhattanDistanceWaypointShip],
                                  errorMessage: "the ship sank")
    }

    static func manhattanDistanceBasicShip(input: String) -> Int? {
        var fairy = BasicShip(facing: .East)
        input.enumerateLines { line, _ in
            let units = Int(line.filter { "0"..."9" ~= $0 })!
            switch line.prefix(1) {
                case "L":
                    fairy.rotate(units * -1)
                    break
                case "R":
                    fairy.rotate(units)
                    break
                case "F":
                    fairy.move(units: units)
                    break
                case "N":
                    fairy.teleport(direction: .North, units: units)
                    break
                case "E":
                    fairy.teleport(direction: .East, units: units)
                    break
                case "S":
                    fairy.teleport(direction: .South, units: units)
                    break
                case "W":
                    fairy.teleport(direction: .West, units: units)
                    break
                default:
                    return
            }
        }
        return Int(fairy.x.magnitude + fairy.y.magnitude)
    }

    static func manhattanDistanceWaypointShip(input: String) -> Int? {
        var fairy = WaypointShip()
        input.enumerateLines { line, _ in
            let units = Int(line.filter { "0"..."9" ~= $0 })!
            switch line.prefix(1) {
                case "L":
                    fairy.rotate(units * -1)
                    break
                case "R":
                    fairy.rotate(units)
                    break
                case "F":
                    fairy.move(units: units)
                    break
                case "N":
                    fairy.moveWaypoint(direction: .North, units: units)
                    break
                case "E":
                    fairy.moveWaypoint(direction: .East, units: units)
                    break
                case "S":
                    fairy.moveWaypoint(direction: .South, units: units)
                    break
                case "W":
                    fairy.moveWaypoint(direction: .West, units: units)
                    break
                default:
                    return
            }
        }
        return Int(fairy.location.x.magnitude + fairy.location.y.magnitude)
    }
}

struct BasicShip {
    enum Direction {
        case North
        case East
        case South
        case West
    }

    var facing: Direction
    var x: Int = 0
    var y: Int = 0

    mutating func teleport(direction: Direction, units: Int) {
        switch direction {
            case .North:
                y += units
                break
            case .East:
                x += units
                break
            case .South:
                y -= units
                break
            case .West:
                x -= units
                break
        }
    }

    mutating func move(units: Int) {
        teleport(direction: facing, units: units)
    }

    mutating func rotate(_ degree: Int) {
        let sign = degree.signum()
        let units = degree.magnitude / 90
        for _ in 0..<units {
            if sign > 0  {
                switch facing {
                    case .North:
                        facing = .East
                        break
                    case .East:
                        facing = .South
                        break
                    case .South:
                        facing = .West
                        break
                    case .West:
                        facing = .North
                        break
                }
            }
            if sign < 0  {
                switch facing {
                    case .North:
                        facing = .West
                        break
                    case .West:
                        facing = .South
                        break
                    case .South:
                        facing = .East
                        break
                    case .East:
                        facing = .North
                        break
                }
            }
        }
    }
}

struct WaypointShip {
    enum Direction {
        case North
        case East
        case South
        case West
    }

    var location = (x:0, y:0)
    var waypoint = (x: 10, y: 1)

    mutating func moveWaypoint(direction: Direction, units: Int) {
        switch direction {
            case .North:
                waypoint.y += units
                break
            case .East:
                waypoint.x += units
                break
            case .South:
                waypoint.y -= units
                break
            case .West:
                waypoint.x -= units
                break
        }
    }

    mutating func move(units: Int) {
        location.x += waypoint.x * units
        location.y += waypoint.y * units
    }

    mutating func rotate(_ degree: Int) {
        let sign = degree.signum()
        let units = degree.magnitude / 90
        for _ in 0..<units {
            if sign > 0 {
                let tmp = waypoint.x
                waypoint.x = waypoint.y
                waypoint.y = tmp * -1
            } else if sign < 0 {
                let tmp = waypoint.x
                waypoint.x = waypoint.y * -1
                waypoint.y = tmp
            }
        }
    }
}
