//
//  Day1.swift
//
//
//  Created by Marz Rover on 12/6/20.
//

import Foundation
import Rainbow

struct Day1: Day {
    func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [self.findNumberPart1,
                                          self.findNumberPart2],
                                  errorMessage: "no number could be found")
    }

    func findNumberPart1(input: String) -> Int? {
        var numbers: [Int] = []
    
        var result: Int? = nil

        input.enumerateLines { line, stop in
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            guard let number = Int(trimmed) else {
                return
            }

            for elem in numbers {
                if elem + number == 2020 {
                    result = elem * number
                    stop = true
                }
            }

            if number < 2020 {
                numbers.append(number)
            }
        }

        return result
    }

    func findNumberPart2(input: String) -> Int? {
        var numbers: [Int] = []
    
        var result: Int? = nil

        input.enumerateLines { line, stop in
            let trimmed = line.trimmingCharacters(in: .whitespaces)
            guard let number = Int(trimmed) else {
                return
            }

            for x in numbers {
                for y in numbers {
                    if x + y + number == 2020 {
                        result = x * y * number
                        stop = true
                    }
                }
            }

            if number < 2020 {
                numbers.append(number)
            }
        }

        return result
    }
}
