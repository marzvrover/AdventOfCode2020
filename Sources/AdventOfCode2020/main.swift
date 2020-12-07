//
//  main.swift
//
//
//  Created by Marz Rover on 12/6/20.
//

import Foundation
import Rainbow

protocol Day {
    func resultString(input: String?) -> String
}

extension Day {
    func resultStringHelper(input: String, parts: [(String) -> Int?], errorMessage: String) -> String {
        var output: String? = nil

        for (index, part) in parts.enumerated() {
            let value: Int? = part(input)
            let result: String
            if value == nil {
                result = errorMessage.lightRed
            } else {
                result = String(value!).lightGreen
            }

            let display = "\tPart \(index): \(result)"

            if output == nil {
                output = display
            } else {
                output!.append("\n\(display)")
            }
        }

        return output!
    }
}

print("Welcome to Marz's Advent of Code 2020".green)

let days: [String:Day] = [
    "one": Day1(),
    "two": Day2(),
    "three": Day3(),
]

for (name, day) in days {
    print("Day \(name):\n\(day.resultString(input: nil))")
}
