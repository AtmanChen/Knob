import SwiftUI

private struct KnobShape: Shape {
  var pointerSize: CGFloat = 0.1
  var pointerWidth: CGFloat = 0.1
  func path(in rect: CGRect) -> Path {
    let pointerHeight = rect.height * pointerSize
    let pointerWidth = rect.width * pointerWidth
    let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
    return Path { p in
      p.addEllipse(in: circleRect)
      p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight * 2))
    }
  }
}

public struct Knob: View {
  @Binding var value: Double
  public var body: some View {
    KnobShape()
      .fill(Color.primary)
      .rotationEffect(Angle(degrees: value * 330))
      .onTapGesture {
        withAnimation(.default) {
          self.value = self.value < 0.5 ? 1 : 0
        }
      }
  }
}

