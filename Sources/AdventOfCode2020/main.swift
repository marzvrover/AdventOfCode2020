//
//  main.swift
//
//
//  Created by Marz Rover on 12/6/20.
//

import Foundation
import AdventOfCode2020Days

print("Welcome to Marz's Advent of Code 2020".green)

let days: [(day: Day, number: String, resource: String)] = [
    (day: Day1(), number: "one", resource: "day1"),
    (day: Day2(), number: "two", resource: "day2"),
    (day: Day3(), number: "three", resource: "day3"),
    (day: Day4(), number: "four", resource: "day4"),
    (day: Day5(), number: "five", resource: "day5"),
]

for (day, number, resource) in days {
    let url = Bundle.module.url(forResource: resource, withExtension: "txt")!
    let file = try! String(contentsOf: url)
    print("Day \(number):\n\(day.resultString(input: file))")
}
