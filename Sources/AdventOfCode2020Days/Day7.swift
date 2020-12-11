//
//  Day7.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation

public struct Day7: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [Self.numberOfBagsEventuallyContainShinyGold,
                                          Self.countBagsInShinyGold],
                                  errorMessage: "no bags could be found")
    }

    static func numberOfBagsEventuallyContainShinyGold(input: String) -> Int? {
        let rules = Self.readRules(input: input)
        var bags = 0
        for (bag, _) in rules {
            if Self.canContainColor(haystack: bag, needle: "shiny gold", rules: rules) {
                bags += 1
            }
        }
        return bags != 0 ? bags : nil
    }
    
    static func countBagsInShinyGold(input: String) -> Int? {
        let rules = Self.readRules(input: input)
        return Self.countBagsIn(color: "shiny gold", rules: rules)
    }

    static func readRules(input: String) -> [String:[String:Int]] {
        var rules: [String:[String:Int]] = [:]

        input.enumerateLines { line, _ in
            let explodedContains = line.components(separatedBy: " bags contain ")
            let key = explodedContains[0]
            var bagRules: [String: Int] = [:]
            var nextToParse = explodedContains[1]
            scanLineRules: while true {
                guard nextToParse.prefix(2) != "no" else {
                    break
                }
                let num = Int(nextToParse.prefix(1))!
                nextToParse = String(nextToParse.dropFirst(2)) // "# "
                let explodedParses = nextToParse.components(separatedBy: " bag")
                bagRules[String(explodedParses[0])] = num
                parseRule: while true {
                    if nextToParse.prefix(1) != "." && nextToParse.prefix(2) != ", " {
                        nextToParse = String(nextToParse.dropFirst(1))
                    } else if nextToParse.prefix(2) == ", " {
                        nextToParse = String(nextToParse.dropFirst(2)) // ", "
                        break parseRule
                    } else { // reached . therefore end of line
                        break scanLineRules
                    }
                }
            }
            rules[key] = bagRules
        }

        return rules
    }

    static func canContainColor(haystack: String, needle: String, rules: [String:[String:Int]]) -> Bool {
        guard rules[haystack] != nil else {
            return false
        }
        guard !rules[haystack]!.isEmpty else {
            return false
        }
        guard !rules[haystack]!.contains(where: { key, _ in
            return key == needle
        }) else {
            return true
        }
        for (rule, _) in rules[haystack]! {
            if Self.canContainColor(haystack: rule, needle: needle, rules: rules) {
                return true
            }
        }
        return false
    }

    static func countBagsIn(color: String, rules: [String:[String:Int]]) -> Int {
        guard rules[color] != nil else {
            return 0
        }
        guard !rules[color]!.isEmpty else {
            return 0
        }
        var count = 0
        for (bag, number) in rules[color]! {
            count += number + (number * Self.countBagsIn(color: bag, rules: rules))
        }
        return count
    }
}
