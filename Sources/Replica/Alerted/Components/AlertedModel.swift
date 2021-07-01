//  Created by Jonathan Danek on 7/1/21.
//  Copyright © 2021 Danek.me All rights reserved.

import Combine

public class AlertedModel: ObservableObject {

  @Published var eyeCandy = AlertedView.EyeCandy.plus

  @Published var alerts: [AlertModel] = [
    AlertModel(string: "qui ipsum laboris sit Excepteur", active: true),
    AlertModel(string: "tempor non id consectetur velit", active: true),
    AlertModel(string: "est cillum eu incididunt labore", active: true),
    AlertModel(string: "in commodo ea magna ullamco", active: true),
    AlertModel(string: "enim dolor in ut dolore", active: true),
    AlertModel(string: "deserunt adipisicing ad Duis nisi", active: false),
    AlertModel(string: "Ut cupidatat Lorem reprehenderit irure", active: false),
    AlertModel(string: "sed voluptate nostrud in culpa", active: false),
    AlertModel(string: "anim quis sunt ut officia", active: false),
    AlertModel(string: "ex do exercitation aliquip nulla", active: false),
    AlertModel(string: "qui ipsum laboris sit Excepteur", active: false),
  ]
}

public struct AlertModel {
  var string: String
  var active: Bool
}
