/*
    参考
    https://zenn.dev/kyome/articles/d6ec2e734291df
*/
import SwiftUI

struct KeyboardView: View {
    private var keys: [KeyState]
    private let onKeyTouched: (Note) -> Void
    private let onKeyReleased: (Note) -> Void
    
    init(onKeyTouched: @escaping (Note) -> Void, onKeyReleased: @escaping (Note) -> Void) {
        // 1オクターブ（0~12）の範囲での黒鍵のインデックス
        let blacks: [Int] = [1, 3, 6, 8, 10]
        // 12鍵盤 × 3オクターブ + ラスト1鍵盤
        keys = (0 ..< 25).map { i in
            // インデックスを12で割った余りで白鍵と黒鍵を判断
            return KeyState(keyType: blacks.contains(i % 12) ? .black : .white)
        }
        
        
        self.onKeyTouched = onKeyTouched
        self.onKeyReleased = onKeyReleased
    }

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(Array(keys.enumerated()), id: \.element) { (offset, keyState) in
                    KeyShape(keyState: keyState)
                        .fill(keyState.color)
                        .aspectRatio(0.08, contentMode: .fit) //1鍵盤の高さを1とした時の幅を0.16として、その半分
                        .zIndex(keyState.zIndex) //黒鍵はzIndexで手前に描画する
                        .onLongPressGesture(minimumDuration: .infinity, maximumDistance: .infinity, pressing: { isPressing in //TODO: これだと恐らくグリッサンドできない
                            let note = Note(offset + 48)
                            // タッチダウンとタッチアップを検出
                            if isPressing {
                                self.onKeyTouched(note)
                            } else {
                                self.onKeyReleased(note)
                            }
                        }, perform: {})

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

struct KeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            KeyboardView(
                onKeyTouched: { note in
                    print("Key \(note) touched")
                },
                onKeyReleased: { note in
                    print("Key \(note) released")
                }
            )
        }
    }
}
