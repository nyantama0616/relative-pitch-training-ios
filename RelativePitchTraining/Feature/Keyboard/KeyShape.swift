import SwiftUI

struct KeyShape: Shape {
    var keyState: KeyState

    // このPathは与えられたrectの2倍の幅を描画領域として扱う
    func path(in rect: CGRect) -> Path {
        let w = rect.size.width
        let h = rect.size.height
        let m = keyState.marginRatio * w
        let l = keyState.lengthRatio
        let r = w / 5.0
        var path = Path()
        path.move(to: CGPoint(x: m, y: 0))
        path.addLine(to: CGPoint(x: 2 * w - m, y: 0))
        path.addLine(to: CGPoint(x: 2 * w - m, y: l * h - r))
        path.addArc(center: CGPoint(x: 2 * w - m - r, y: l * h - r),
                    radius: r,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: m + r, y: l * h))
        path.addArc(center: CGPoint(x: m + r, y: l * h - r),
                    radius: r,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.closeSubpath()
        return path
    }
}
