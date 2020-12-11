//
//  main.swift
//
//
//  Created by Marz Rover on 12/6/20.
//

import Foundation
import Rainbow

protocol Day {
    func resultString(input: String) -> String
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

            let display = "\tPart \(index + 1): \(result)"

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

let days: [(day: Day, number: String, resource: String)] = [
    (day: Day1(), number: "one", resource: "day1"),
    (day: Day2(), number: "two", resource: "day2"),
    (day: Day3(), number: "three", resource: "day3"),
    (day: Day4(), number: "four", resource: "day4"),
]

for (day, number, resource) in days {
    let url = Bundle.module.url(forResource: resource, withExtension: "txt")!
    let file = try! String(contentsOf: url)
    print("Day \(number):\n\(day.resultString(input: file))")
}
