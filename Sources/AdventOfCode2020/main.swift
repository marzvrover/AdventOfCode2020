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

let day1 = Day1()
print("Day one:\n\(day1.resultString())")

let day2 = Day2()
print("Day two:\n\(day2.resultString())")
