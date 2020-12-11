//
//  Day5.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation

public struct Day5: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [self.findHighestSeatId,
                                          self.findMySeatId],
                                  errorMessage: "no seat could be found")
    }

    func findHighestSeatId(input: String) -> Int? {
        var highest = 0
        input.enumerateLines { line, _ in
            let seat = Self.processBoardingPass(input: line).seat
            if seat > highest {
                highest = seat
            }
        }
        return highest
    }

    func findMySeatId(input: String) -> Int? {
        var seats: [Int] = []
        input.enumerateLines { line, _ in
            seats.append(Self.processBoardingPass(input: line).seat)
        }
        let missing = Self.findMissingSeats(input: seats)
        for seat in missing {
            if !missing.contains(seat-1) && !missing.contains(seat+1) {
                return seat
            }
        }
        return nil
    }

    static func findMissingSeats(input: [Int]) -> [Int] {
        var missing: [Int] = []
        for number in 0...input.max()! {
            if !input.contains(number) {
                missing.append(number)
            }
        }
        return missing
    }

    static func processBoardingPass(input: String) -> (row: Int, col: Int, seat: Int) {
        let row = calculateRow(input.prefix(7))!
        let col = calculateCol(input.suffix(3))!
        return (row: row, col: col, seat: (row * 8) + col)
    }

    static func calculateRow(_ input: Substring) -> Int? {
        let out = String(input)
            .replacingOccurrences(of: "F", with: "0")
            .replacingOccurrences(of: "B", with: "1")
        return Int(out, radix: 2)
    }

    static func calculateCol(_ input: Substring) -> Int? {
        let out = String(input)
            .replacingOccurrences(of: "L", with: "0")
            .replacingOccurrences(of: "R", with: "1")
        return Int(out, radix: 2)
    }
}
