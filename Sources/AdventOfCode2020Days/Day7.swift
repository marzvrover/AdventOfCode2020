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
                                  parts: [self.numberOfBagsEventuallyContainGold],
                                  errorMessage: "no bags could be found")
    }
    
    func numberOfBagsEventuallyContainGold(input: String) -> Int? {
        return nil
    }
}
