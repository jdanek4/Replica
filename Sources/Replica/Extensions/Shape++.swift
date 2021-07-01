//  Created by Jonathan Danek on 6/17/21.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI

extension Shape {
  /// fills and strokes a shape
  public func fill<S: ShapeStyle>(
    _ fillContent: S,
    stroke: StrokeStyle
  ) -> some View {
    ZStack {
      self.fill(fillContent)
      self.stroke(style: stroke)
    }
  }
}
