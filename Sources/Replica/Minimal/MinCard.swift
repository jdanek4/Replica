//  Created by Jonathan Danek on 6/15/21.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI

public struct MinCard: View {

  var title: String = "Bank of Focus"
  @State var color = Color.pastel.shuffled().first!

  public var body: some View {
      ZStack {

        RoundedRectangle(cornerRadius: 15.0)
          .fill(color, stroke: StrokeStyle(lineWidth: 1.0))
        VStack {
          Spacer()

        Image(systemName: "creditcard")
          .font(.largeTitle)

          Spacer()

          HStack(alignment: .center) {
            Text(title)
              .font(Font.system(size: 8.0, weight: .medium, design: .default))
              .lineLimit(1)
            Spacer()
          }
          .minimumScaleFactor(0.5)
          .padding(.horizontal, 5.0)
          .padding(.bottom, 10.00)
        }
      }
    }
}

public struct MinCard_Previews: PreviewProvider {
  public static var previews: some View {
      MinCard()
        .frame(width: 100, height: 150, alignment: .center)
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
