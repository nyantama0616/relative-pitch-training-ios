import SwiftUI

struct ContentView: View {
    @State var keys: [KeyState]

    init() {
        // 1オクターブ（0~12）の範囲での黒鍵のインデックス
        let blacks: [Int] = [1, 3, 6, 8, 10]
        // 12鍵盤 × 3オクターブ + ラスト1鍵盤
        keys = (0 ..< 25).map { i in
            // インデックスを12で割った余りで白鍵と黒鍵を判断
            return KeyState(keyType: blacks.contains(i % 12) ? .black : .white)
        }
    }

    var body: some View {
        ZStack {
            Color.black
            KeyboardView(keys: $keys)
        }
    }
}

#Preview {
    ContentView()
}
