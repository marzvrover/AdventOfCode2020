//
//  Day9.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation

public struct Day9: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [Self.firstNumberException,
                                          Self.continousSum],
                                  errorMessage: "no numbers could be found")
    }

    static func firstNumberException(input: String) -> Int? {
        return Self.firstNumberException(input: input, offset: 25)
    }

    static func continousSum(input: String) -> Int? {
        return Self.continousSum(input: input, offset: 25)
    }

    static func continousSum(input: String, offset: Int) -> Int? {
        let numbers = Self.readData(input: input)
        let exception = Self.firstNumberException(input: input, offset: offset)
        guard exception != nil else {
            return nil
        }
        let index = numbers.firstIndex(of: exception!)!
        let preceding = numbers[0..<index]
        start: for i in 0..<index {
            end: for j in (i..<index).reversed() {
                if preceding[i...j].reduce(0, +) == exception {
                    return preceding[i...j].min()! + preceding[i...j].max()!
                }
            }
        }
        return nil
    }

    static func firstNumberException(input: String, offset: Int) -> Int? {
        let data = Self.readData(input: input)
        scan: for (i, value) in data[offset..<data.count].enumerated() {
            let j = i + offset
            let preamble = data[j-offset..<i+offset]
            var it = true
            for x in preamble {
                for y in preamble {
                    if x + y == value {
                        it = false
                        continue scan
                    }
                }
            }
            if it {
                return value
            }
        }
        return nil
    }

    static func readData(input: String) -> [Int] {
        var data: [Int] = []
        input.enumerateLines { line, _ in
            data.append(Int(line.trimmingCharacters(in: .whitespacesAndNewlines))!)
        }
        return data
    }
}
