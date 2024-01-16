import SwiftUI

struct KeyState: Hashable, Identifiable {
    enum KeyType {
        case white
        case black
    }

    let id: UUID
    let keyType: KeyType

    init(keyType: KeyType) {
        self.id = UUID()
        self.keyType = keyType
    }

    var marginRatio: Double {
        return keyType == .white ? 0.1 : 0.3
    }

    var lengthRatio: Double {
        return keyType == .white ? 1.0 : 0.6
    }

    var color: Color {
        return keyType == .white ? Color.white : Color.black
    }

    var zIndex: Double {
        return keyType == .white ? 0.0 : 1.0
    }
}
