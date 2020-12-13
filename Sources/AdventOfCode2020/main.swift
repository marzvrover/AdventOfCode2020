//
//  main.swift
//
//
//  Created by Marz Rover on 12/6/20.
//

import AdventOfCode2020Days
import ArgumentParser
import Foundation

let allDays: [(day: Day, number: String, resource: String)] = [
    (day: Day1(), number: "one", resource: "day1"),
    (day: Day2(), number: "two", resource: "day2"),
    (day: Day3(), number: "three", resource: "day3"),
    (day: Day4(), number: "four", resource: "day4"),
    (day: Day5(), number: "five", resource: "day5"),
    (day: Day6(), number: "six", resource: "day6"),
    (day: Day7(), number: "seven", resource: "day7"),
    (day: Day8(), number: "eight", resource: "day8"),
    (day: Day9(), number: "nine", resource: "day9"),
    (day: Day10(), number: "ten", resource: "day10"),
    (day: Day11(), number: "eleven", resource: "day11"),
]

enum Days: String, EnumerableFlag {
    case Day1, Day2, Day3, Day4, Day5, Day6, Day7, Day8, Day9, Day10, Day11
}

struct AdventOfCode2020: ParsableCommand {
    @Flag(help: "Days you would like to run.")
    var days: [Days] = []

    mutating func run() {
        print("Welcome to Marz's Advent of Code 2020".green)

        guard !days.isEmpty else {
            return runAllDays()
        }

        for day in days.sorted(by: {
            Int($0.rawValue.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())!
                < Int($1.rawValue.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())!
        }) {
            let index = Int(day.rawValue.components(separatedBy: CharacterSet.decimalDigits.inverted).joined())! - 1
            let challenge = allDays[index]
            let url = Bundle.module.url(forResource: challenge.resource, withExtension: "txt")!
            let file = try! String(contentsOf: url)
            print("Day \(challenge.number):\n\(challenge.day.resultString(input: file))")
        }
    }
    
    func runAllDays() {
        for (day, number, resource) in allDays {
            let url = Bundle.module.url(forResource: resource, withExtension: "txt")!
            let file = try! String(contentsOf: url)
            print("Day \(number):\n\(day.resultString(input: file))")
        }
    }
}

AdventOfCode2020.main()
