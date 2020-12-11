//
//  Day2.swift
//  
//
//  Created by Marz Rover on 12/6/20.
//

import Foundation
import Rainbow

fileprivate extension StringProtocol {
    subscript(offset: Int) -> Character { self[index(startIndex, offsetBy: offset)] }
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    subscript(range: PartialRangeFrom<Int>) -> SubSequence { self[index(startIndex, offsetBy: range.lowerBound)...] }
    subscript(range: PartialRangeThrough<Int>) -> SubSequence { self[...index(startIndex, offsetBy: range.upperBound)] }
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence { self[..<index(startIndex, offsetBy: range.upperBound)] }
}

fileprivate extension Bool {
    static func ^ (left: Bool, right: Bool) -> Bool {
        return left != right
    }
}

public struct Day2: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [self.countValidPart1,
                                          self.countValidPart2],
                                  errorMessage: "no valid passwords could be found")
    }

    func countValidPart1(input: String) -> Int? {
        var valid = 0

        input.enumerateLines { line, _ in
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            let password: (requirements: (count: (min: Int, max: Int), letter: Character), value: String)
            let explodedReqAndVal = trimmed.split(separator: ":")
            let explodedReq = explodedReqAndVal[0].split(separator: " ")
            let explodedCount = explodedReq[0].split(separator: "-")

            password = (requirements: (count: (min: Int(explodedCount[0].trimmingCharacters(in: .whitespacesAndNewlines))!,
                                               max: Int(explodedCount[1].trimmingCharacters(in: .whitespacesAndNewlines))!),
                                       letter: Character(explodedReq[1].trimmingCharacters(in: .whitespacesAndNewlines))),
                        value: explodedReqAndVal[1].trimmingCharacters(in: .whitespacesAndNewlines))

            let occurrences = password.value.components(separatedBy: String(password.requirements.letter)).count - 1

            valid += occurrences >= password.requirements.count.min && occurrences <= password.requirements.count.max ? 1 : 0
        }
        
        return valid != 0 ? valid : nil
    }

    func countValidPart2(input: String) -> Int? {
        var valid = 0

        input.enumerateLines { line, _ in
            let trimmed = line.trimmingCharacters(in: .whitespacesAndNewlines)
            let password: (requirements: (location: (x: Int, y: Int), letter: Character), value: String)
            let explodedReqAndVal = trimmed.split(separator: ":")
            let explodedReq = explodedReqAndVal[0].split(separator: " ")
            let explodedCount = explodedReq[0].split(separator: "-")

            password = (requirements: (location: (x: Int(explodedCount[0].trimmingCharacters(in: .whitespacesAndNewlines))!,
                                                  y: Int(explodedCount[1].trimmingCharacters(in: .whitespacesAndNewlines))!),
                                       letter: Character(explodedReq[1].trimmingCharacters(in: .whitespacesAndNewlines))),
                        value: explodedReqAndVal[1].trimmingCharacters(in: .whitespacesAndNewlines))

            if (password.value[password.requirements.location.x - 1] == password.requirements.letter)
                ^ (password.value[password.requirements.location.y - 1] == password.requirements.letter) {
                valid += 1
            }
        }
        
        return valid != 0 ? valid : nil
    }
}
