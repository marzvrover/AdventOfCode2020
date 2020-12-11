//
//  Day5.swift
//
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation

public struct Day6: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [self.sumOfAllGroups,
                                          self.sumOfCompleteAllGroups],
                                  errorMessage: "no yeses could be found")
    }

    func sumOfAllGroups(input: String) -> Int? {
        let groups = input.components(separatedBy: "\n\n")
        var sum = 0
        for group in groups {
            sum += Self.countGroupYeses(input: group)
        }
        return sum != 0 ? sum : nil
    }
    
    func sumOfCompleteAllGroups(input: String) -> Int? {
        let groups = input.components(separatedBy: "\n\n")
        var sum = 0
        for group in groups {
            sum += Self.countCompleteGroupYeses(input: group)
        }
        return sum != 0 ? sum : nil
    }

    static func countGroupYeses(input: String) -> Int {
        var yeses = 0
        for char in Unicode.Scalar("a").value...Unicode.Scalar("z").value {
            if input.contains(Character(Unicode.Scalar(char)!)) {
                yeses += 1
            }
        }
        return yeses
    }

    static func countCompleteGroupYeses(input: String) -> Int {
        var letters = ""
        input.enumerateLines { line, stop in
            if letters.isEmpty {
                letters = line
            }
            for char in letters {
                if !line.contains(char) {
                    letters.removeAll(where: {$0 == char})
                    if (letters.isEmpty) {
                        stop = true
                    }
                }
            }
        }
        return letters.count
    }
}
