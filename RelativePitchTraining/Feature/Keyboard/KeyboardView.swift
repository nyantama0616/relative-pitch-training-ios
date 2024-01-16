import SwiftUI

struct KeyboardView: View {
    @Binding var keys: [KeyState]

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(Array(keys.enumerated()), id: \.element) { (offset, keyState) in
                    KeyShape(keyState: keyState)
                        .fill(keyState.color)
            // 1鍵盤の高さを1とした時の幅を0.16として、その半分
                        .aspectRatio(0.08, contentMode: .fit)
                        // 黒鍵はzIndexで手前に描画する
            .zIndex(keyState.zIndex)
            // 黒鍵の歯抜けの箇所を補うためにダミーのViewを配置する
                    if [4, 11].contains(offset % 12) || offset == keys.count - 1 {
                        Rectangle()
                            .aspectRatio(0.08, contentMode: .fit)
                            .hidden()
                    }
                }
            }
        }
    // 3.52 = 0.16 × (7白鍵 × 3オクターブ + ラスト1鍵盤)
        .aspectRatio(3.52, contentMode: .fit)
    }
}
