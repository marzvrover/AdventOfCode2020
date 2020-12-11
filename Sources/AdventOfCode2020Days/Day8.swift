//
//  Day8.swift
//  
//
//  Created by Marz Rover on 12/11/20.
//

import Foundation

public struct Day8: Day {
    public init() {}

    public func resultString(input: String) -> String {
        return resultStringHelper(input: input,
                                  parts: [Self.accumulatorBeforeInfiniteLoop,
                                          Self.fixedBootLoaderAccumulator],
                                  errorMessage: "VM error")
    }

    static func accumulatorBeforeInfiniteLoop(input: String) -> Int? {
        var vm = VM(accumulator: 0, program: VM.interpretProgram(input: input))
        return vm.accumulatorBeforeInfiniteLoop()
    }

    // Brute force, should probably of done something different
    static func fixedBootLoaderAccumulator(input: String) -> Int? {
        let program = VM.interpretProgram(input: input)
        for i in 0...program.count {
            var current = VM.interpretProgram(input: input)
            if current[i].instruction == "jmp" {
                current[i].instruction = "nop"
            } else if current[i].instruction == "nop" {
                current[i].instruction = "jmp"
            } else {
                continue
            }
            guard VM.debugProgram(program: current) != nil  else {
                var vm = VM(accumulator: 0, program: current)
                return vm.runProgram()
            }
        }
        return nil
    }
}

struct VM {
    typealias Program = [(instruction: String, value: Int)]
    var accumulator: Int
    var program: Program

    mutating func runProgram() -> Int? {
        var lines: [Bool] = [Bool](repeating: false, count: program.count)
        var lineCounter = 0
        while lineCounter < program.count {
            guard lineCounter < lines.count else {
                return nil
            }
            guard !lines[lineCounter] else {
                return nil
            }
            lines[lineCounter] = true
            let (instruction, value) = program[lineCounter]
            switch instruction {
                case "acc":
                    accumulator += value
                    break
                case "jmp":
                    lineCounter = lineCounter + value
                    continue
                case "nop":
                    break
                default:
                    return nil
            }
            lineCounter += 1
        }
        return accumulator
    }

    mutating func accumulatorBeforeInfiniteLoop() -> Int? {
        var lines: [Bool] = [Bool](repeating: false, count: program.count)
        var lineCounter = 0
        while lineCounter < program.count {
            guard lineCounter < lines.count else {
                return nil
            }
            guard !lines[lineCounter] else {
                return accumulator
            }
            lines[lineCounter] = true
            let (instruction, value) = program[lineCounter]
            switch instruction {
                case "acc":
                    accumulator += value
                    break
                case "jmp":
                    lineCounter = lineCounter + value
                    continue
                case "nop":
                    break
                default:
                    return nil
            }
            lineCounter += 1
        }
        return nil
    }

    static func debugProgram(program input: Program) -> Int? {
        var vm = VM(accumulator: 0, program: input)
        var lines: [Bool] = [Bool](repeating: false, count: vm.program.count)
        var lastCounter = 0
        var lineCounter = 0
        while lineCounter < vm.program.count {
            guard lineCounter < lines.count else {
                return lastCounter
            }
            guard !lines[lineCounter] else {
                return lastCounter
            }
            lines[lineCounter] = true
            let (instruction, value) = vm.program[lineCounter]
            switch instruction {
                case "acc":
                    vm.accumulator += value
                    break
                case "jmp":
                    lastCounter = lineCounter
                    lineCounter = lineCounter + value
                    continue
                case "nop":
                    break
                default:
                    return lineCounter
            }
            lastCounter = lineCounter
            lineCounter += 1
        }
        return nil
    }

    static func interpretProgram(input: String) -> Program {
        var program: Program = []
        input.enumerateLines { line, _ in
            let words = line.components(separatedBy: " ")
            program.append((instruction: words[0], value: Int(words[1])!))
        }
        return program
    }
}
