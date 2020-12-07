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

print("Welcome to Marz's Advent of Code 2020".green)

let days: [(day: Day, name: String)] = [
    (day: Day1(), name: "one"),
    (day: Day2(), name: "two"),
    (day: Day3(), name: "three"),
]

for (day, name) in days {
    print("Day \(name):\n\(day.resultString(input: nil))")
}
