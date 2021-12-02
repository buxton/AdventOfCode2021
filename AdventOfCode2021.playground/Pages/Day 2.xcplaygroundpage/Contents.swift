import Foundation

// --- Day 2: Dive! ---

guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else { fatalError() }

let directionInput = try String(contentsOf: fileUrl)

let lines: [String] = directionInput.components(separatedBy: "\n").filter { !$0.isEmpty }

enum Direction: String {
    case up, down, forward
}

struct Line {
    let direction: Direction
    let length: Int
}

struct ParseError: Error, LocalizedError {
    public let errorDescription: String?
}

func parseLineValue(line: String) throws -> Line {
    let components: [String] = line.components(separatedBy: " ")

    guard components.count == 2,
          let direction = Direction(rawValue: components[0]),
          let amount = Int(components[1])
    else {
        throw ParseError(errorDescription: "Invalid Line")
    }

    return Line(direction: direction, length: amount)
}

// MARK: Part 1
func calculateCourse(lines: [Line]) -> Int {

    var horizontalPos = 0
    var depth = 0

    for line in lines {
        switch line.direction {
        case .forward:
            horizontalPos += line.length
        case .down:
            depth += line.length
        case .up:
            depth -= line.length
        }
    }

    return horizontalPos * depth
}

let directions = try lines.map(parseLineValue)
let courseDistance = calculateCourse(lines: directions)

print("Part 1 Answer")
print(courseDistance)

// MARK: Part 2
func calculateCourseWithAim(lines: [Line]) -> Int {

    var horizontalPos = 0
    var depth = 0
    var aim = 0

    for line in lines {
        switch line.direction {
        case .forward:
            horizontalPos += line.length
            depth += aim * line.length
        case .down:
            aim += line.length
        case .up:
            aim -= line.length
        }
    }

    return horizontalPos * depth
}

let courseDistanceUpdated = calculateCourseWithAim(lines: directions)

print("Part 2 Answer")
print(courseDistanceUpdated)
