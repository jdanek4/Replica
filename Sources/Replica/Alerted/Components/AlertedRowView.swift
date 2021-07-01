//  Created by Jonathan Danek on 7/1/21.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI

struct AlertedRowView: View {

  var model: AlertModel
  var body: some View {
    HStack {
      RoundedRectangle(cornerRadius: 5.0)
        .foregroundColor(model.active ? .green : .orange)
        .overlay(Image(systemName: "cart.circle.fill").font(.largeTitle).colorInvert())
        .aspectRatio(CGSize(width: 1, height: 1), contentMode: .fit)

      VStack(
        alignment: .leading,
        spacing: nil,
        content: {
          Text(model.string).font(.title).bold()
            .lineLimit(1)
            .minimumScaleFactor(0.5)
            .foregroundColor(.black)
          Spacer()
          Text(model.active ? "Auto updating" : "").font(.footnote).foregroundColor(.black)
        }
      )

      Spacer()
    }
    .aspectRatio(CGSize(width: 5, height: 1), contentMode: .fit)
    .padding()
    .background(Color.white)
  }
}

struct AlertedRowView_Previews: PreviewProvider {
  static var previews: some View {
    AlertedRowView(model: .init(string: "anim quis sunt ut officia", active: true))
  }
}
