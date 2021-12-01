//
// Advent of Code 2021
// Buxton
//

import Foundation

// MARK: Day 1
print("Day 1")
let depthValues = try readValues()

// Part 1
let partOne = summedValues(list: depthValues)
print("Part 1 = \(partOne)")

// Part 2
let windowedDepthValues = windowedValues(list: depthValues, window: 3)
let partTwo = summedValues(list: windowedDepthValues)
print("Part 2 = \(partTwo)")
