//
//  Day4.swift
//  
//
//  Created by Marz Rover on 12/7/20.
//

import Foundation

public struct Day4: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [self.countValidCredentials1,
                                          self.countValidCredentials2],
                                  errorMessage: "no valid credentials could be found")
    }

    func countValidCredentials1(input: String) -> Int? {
        var valid: Int = 0
        let credentials = input.components(separatedBy: "\n\n")

        for credential in credentials {
            if credentialHasFields(input: credential) {
                valid += 1
            }
        }

        return valid > 0 ? valid : nil
    }

    func countValidCredentials2(input: String) -> Int? {
        var valid: Int = 0
        let credentials = input.components(separatedBy: "\n\n")

        for credential in credentials {
            if credentialHasFields(input: credential)
                && (try! Credential(input: credential)).isValid {
                valid += 1
            }
        }

        return valid > 0 ? valid : nil
    }

    func credentialHasFields(input: String) -> Bool {
        do {
            try Credential(input: input)
        } catch {
            return false
        }
        return true
    }

    enum CredentialError: Error {
        case MissingFields([Substring:Substring])
    }

    struct Credential {
        var data: [Substring:Substring] = [:]
        var isValid: Bool {
            return isBirthYearValid(year: Int(data["byr"]!)!)
                && isIssueYearValid(year: Int(data["iyr"]!)!)
                && isExpirationYearValid(year: Int(data["eyr"]!)!)
                && isHeightValid(height: data["hgt"]!)
                && isHairColorValid(color: data["hcl"]!)
                && isEyeColorValid(color: data["ecl"]!)
                && isPassportIdValid(id: data["pid"]!)
        }

        @discardableResult
        init(input: String) throws {
            let line = input
                .replacingOccurrences(of: "\n", with: " ")
                .trimmingCharacters(in: .whitespacesAndNewlines)
            let fields = line.split(separator: " ")

            for field in fields {
                let exploded = field.split(separator: ":")
                data[exploded[0]] = exploded[1]
            }

            if (data.count < 7) || (data.count == 7 && data["cid"] != nil) {
                throw CredentialError.MissingFields(data)
            }
        }

        private func isBirthYearValid(year: Int) -> Bool {
            return 1920 <= year && year <= 2002
        }

        private func isIssueYearValid(year: Int) -> Bool {
            return 2010 <= year && year <= 2020
        }

        private func isExpirationYearValid(year: Int) -> Bool {
            return 2020 <= year && year <= 2030
        }

        private func isHeightValid(height: Substring) -> Bool {
            let unit = height.suffix(2)
            let value = Int(height.dropLast(2))!

            if unit == "cm" {
                return 150 <= value && value <= 193
            } else if unit == "in" {
                return 59 <= value && value <= 76
            } else {
                return false
            }
        }

        private func isHairColorValid(color: Substring) -> Bool {
            let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray:["^#[A-Fa-f0-9]{6}$"])
            return predicate.evaluate(with: color)
        }

        private func isEyeColorValid(color: Substring) -> Bool {
            let validColors = ["amb", "blu", "brn", "gry", "grn", "hzl", "oth"]
            return validColors.contains(String(color))
        }

        private func isPassportIdValid(id: Substring) -> Bool {
            let predicate = NSPredicate(format: "SELF MATCHES %@", argumentArray:["^[0-9]{9}$"])
            return predicate.evaluate(with: id)
        }
    }
}
