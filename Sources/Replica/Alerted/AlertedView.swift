//  Created by Jonathan Danek on 7/1/21.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI

struct AlertedView: View {
  @ObservedObject var model = AlertedModel()

  enum EyeCandy {
    case plus
    case basic

    var view: some View {
      switch self {
      case .basic:
        return Text("Basic User").foregroundColor(Color.gray)
      case .plus:
        return Text("Plus User").foregroundColor(Color.orange)
      }
    }
  }

  var header: some View {
    ZStack {
      Color.black

      VStack(spacing: 10.0) {
        model.eyeCandy.view
        Text("Notifications")
          .font(.largeTitle)
          .bold()
        Text("\(model.alerts.filter(\.active).count) active!")
      }
      .padding(40)
      .foregroundColor(.white)
    }
    .ignoresSafeArea()

  }

  var content: some View {
    ForEach(model.alerts, id: \.string) { alert in
      AlertedRowView(model: alert)
    }
  }

  var body: some View {
    ScrollView {
      VStack {
        header
        content
      }
    }
  }
}

struct AlertedView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      AlertedView(model: .init())
        .preferredColorScheme(.dark)
      AlertedView(model: .init())
        .preferredColorScheme(.light)
    }
  }
}
