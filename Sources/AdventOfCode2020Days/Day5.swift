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
                                  parts: [self.findHighestSeatId],
                                  errorMessage: "no seat could be found")
    }

    func findHighestSeatId(input: String) -> Int? {
        return nil
    }

    static func processBoardingPass(input: String) -> (row: Int, col: Int, seat: Int) {
        let row = calculateRow(input.prefix(7))!
        let col = calculateCol(input.suffix(3))!
        return (row: row, col: col, seat: (row * 8) + col)
    }

    static func calculateRow(_ input: Substring) -> Int? {
        return 0
    }
/*
     The last three characters will be either L or R; these specify exactly one of the 8 columns of seats on the plane (numbered 0 through 7). The same process as above proceeds again, this time with only three steps. L means to keep the lower half, while R means to keep the upper half.

     For example, consider just the last 3 characters of FBFBBFFRLR:

     Start by considering the whole range, columns 0 through 7.
     R means to take the upper half, keeping columns 4 through 7.
     L means to take the lower half, keeping columns 4 through 5.
     The final R keeps the upper of the two, column 5.
     
     LRL
     8
     4

     */
    static func calculateCol(_ input: Substring) -> Int? {
        var range = 1...8
        for char in input {
            switch char {
                case "L":
                    range = range.lowerBound...(range.upperBound/2)
                    break
                case "R":
                    range = (range.upperBound/2)...range.upperBound
                    break
                default:
                    return nil
            }
        }
        return range.lowerBound - 1
    }
}
