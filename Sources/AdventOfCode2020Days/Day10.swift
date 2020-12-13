//
//  Day10.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation
import Heap

public struct Day10: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [Self.allAdaptersJoltDifferences,
                                          Self.combinationsTotal],
                                  errorMessage: "no combinations could be found")
    }

    static func allAdaptersJoltDifferences(input: String) -> Int? {
        var adapters = MinHeap<Int>()
        var max = 0
        input.enumerateLines { line, _ in
            let adapter = Int(line)!
            if adapter > max {
                max = adapter
            }
            adapters.add(adapter)
        }
        adapters.add(max + 3)
        var diff = (one: 0, two: 0, three: 0)
        var last = 0
        for _ in 0..<adapters.size {
            let adapter = adapters.pull()!
            switch adapter - last {
                case 1:
                    diff.one += 1
                    break
                case 2:
                    diff.two += 1
                    break
                case 3:
                    diff.three += 1
                    break
                default:
                    return nil
            }
            last = adapter
        }

        return diff.one * diff.three
    }

    static func combinationsTotal(input: String) -> Int? {
        var adapters: [Int] = [0]
        input.enumerateLines { line, _ in
            let adapter = Int(line)!
            adapters.append(adapter)
        }
        adapters.append(adapters.max()! + 3)
        adapters.sort(by: { $0 < $1 })

        var groupOfOnesCount: [Int] = []
        var currentCount = 0
        for index in 0...(adapters.count - 2) {
            if adapters[index+1] - adapters[index] == 1 {
                currentCount += 1
            } else {
                currentCount -= 1
                if currentCount >= 1 {
                    groupOfOnesCount.append(currentCount)
                }
                currentCount = 0
            }
        }

        var totalCombinations = 1

        for group in groupOfOnesCount {
            totalCombinations *= combinations(group)!
        }

        return totalCombinations
    }

    static func combinations(_ x: Int) -> Int? {
        if x == 0 {
            return 1
        } else if x == 1 {
            return 2
        } else if x == 2 {
            return 4
        } else if x > 2 {
            return combinations(x-1)! + combinations(x-2)! + combinations(x-3)!
        } else {
            return nil
        }
    }
}
