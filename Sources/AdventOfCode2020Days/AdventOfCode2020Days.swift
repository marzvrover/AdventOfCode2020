//
//  File.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation
import Rainbow

public protocol Day {
    func resultString(input: String) -> String
}

public extension Day {
    internal func resultStringHelper(input: String, parts: [(String) -> Int?], errorMessage: String) -> String {
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
