import Foundation

let noteNames = [
    "C",
    "CSharp",
    "D",
    "DSharp",
    "E",
    "F",
    "FSharp",
    "G",
    "GSharp",
    "A",
    "ASharp",
    "B"
]
public struct Note {
    public let number: Int
    public let name: String

    init(_ number: Int) {
        if number < 0 || number > 127 {
            fatalError("Note number must be between 0 and 127")
        }

        self.number = number
        
        let octave = number / 12 - 1
        self.name = noteNames[number % 12] + String(octave)
    }
}
