//
//  Day3.swift
//  
//
//  Created by Marz Rover on 12/7/20.
//

import Foundation

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


struct Day3: Day {
    func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [self.countTreesPart1,
                                          self.countTreesPart2],
                                  errorMessage: "path will always fail")
    }

    func countTreesPart1(input: String) -> Int? {
        return self.countTreesInPath(input: input, path: (right: 3, down: 1))
    }

    func countTreesPart2(input: String) -> Int? {
        let results = [
            self.countTreesInPath(input: input, path: (right: 1, down: 1)),
            self.countTreesInPath(input: input, path: (right: 3, down: 1)),
            self.countTreesInPath(input: input, path: (right: 5, down: 1)),
            self.countTreesInPath(input: input, path: (right: 7, down: 1)),
            self.countTreesInPath(input: input, path: (right: 1, down: 2)),
        ]

        var trees = 1

        for result in results {
            guard result != nil else {
                return nil
            }

            trees *= result!
        }

        return trees
    }


    func countTreesInPath(input: String, path: (right: Int, down: Int)) -> Int? {
        let buffer = input.split(whereSeparator: \.isNewline)
        let xCount = buffer[0].count
        var yIndex = 0
        var xIndex = 0
        var trees = 0

        while yIndex < buffer.count - path.down {
            if xIndex + path.right < xCount {
                xIndex = xIndex + path.right
            } else {
                xIndex = xIndex + path.right - xCount
            }

            yIndex += path.down

            if buffer[yIndex][xIndex] == "#" {
                trees += 1
            }
        }

        return yIndex == buffer.count - 1 ? trees : nil
    }
}
