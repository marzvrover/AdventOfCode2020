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
        var adapters: [Int] = []
        input.enumerateLines { line, _ in
            let adapter = Int(line)!
            adapters.append(adapter)
        }
        adapters.append(adapters.max()! + 3)
        adapters.sort(by: { $0 < $1 })
        
        return nil
    }
}
