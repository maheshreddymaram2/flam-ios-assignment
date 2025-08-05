import Foundation

enum ConsoleColor {
    case red, green, yellow

    static func print(_ message: String, color: ConsoleColor) {
        let colorCode: String
        switch color {
        case .red: colorCode = "\u{001B}[0;31m"
        case .green: colorCode = "\u{001B}[0;32m"
        case .yellow: colorCode = "\u{001B}[0;33m"
        }

        Swift.print("\(colorCode)\(message)\u{001B}[0;0m")
    }
}

