//  Created by Jonathan Danek on 7/2/21.
//  Copyright © 2021 Danek.me All rights reserved.

import SwiftUI

public struct Typography: View {

  public enum Style {
    case billboard(text: String)
    case quote(text: String, source: String)
    case article(text: String, title: String, subtitle: String?)
    case galleryImage(text: String, image: String)

    static func article(text: String, title: String) -> Style {
      .article(text: text, title: title, subtitle: nil)
    }
  }

  var style: Style

  public init(style: Style) {
    self.style = style
  }

  public init(text: String, image: String) {
    style = .galleryImage(text: text, image: image)
  }

  public init(text: String) {

    style = .billboard(text: text)
  }
  public init(text: String, source: String) {

    style = .quote(text: text, source: source)
  }
  public init(text: String, title: String, subtitle: String?) {

    style = .article(text: text, title: title, subtitle: subtitle)
  }

  public var body: some View {
    switch style {
    case .billboard: makeBillboard()
    case .quote: makeQuote()
    case .article: makeArticle()
    case .galleryImage: makeGalleryImage()
    }
  }

  private func makeBillboard() -> AnyView? {
    guard case let .billboard(text: text) = style else { return nil }
    return VStack {
      Spacer(minLength: 100.0)
      Text(text)
        .font(.system(size: 50, weight: .heavy))
        .bold()
        .textCase(.uppercase)
        .lineSpacing(20.0)
        .lineLimit(3)
        .minimumScaleFactor(0.5)
        .padding(.horizontal, 10.0)
        .padding(.vertical, 50.0)
      Spacer(minLength: 100.0)
    }
    .anyView()
  }

  private func makeQuote() -> AnyView? {
    guard case let .quote(text: text, source: source) = style else { return nil }
    let formattedSource = "- " + source
    return VStack {
      Text(text)
        .italic()
        .font(
          .system(size: 50.0, weight: .semibold, design: .default)
            .italic()
        )
        .fontWeight(.semibold) + Text(formattedSource).bold()
    }
    .padding()
    .lineLimit(3)
    .minimumScaleFactor(0.5)
    .anyView()
  }

  private func makeArticle() -> AnyView? {
    guard case let .article(text: text, title: title, subtitle: subtitle) = style else {
      return nil
    }
    return VStack(alignment: .leading) {
      Text(title)
        .font(.title)
        .bold()
        .padding()

      if let subtitle = subtitle {
        Text(subtitle)
          .font(.caption.bold())
          .padding()
      }

      Divider()

      Text(text)
        .font(.body.bold())
        .padding()
    }
    .anyView()
  }

  private func makeGalleryImage() -> AnyView? {
    guard case let .galleryImage(text: text, image: image) = style else { return nil }
    return VStack {
      Image(image, bundle: .module)
        .resizable()
        .clipShape(
          RoundedRectangle(cornerRadius: 20.0, style: .circular)
        )
        .scaledToFit()

      Text(text)
        .font(.footnote)
    }
    .padding()
    .anyView()
  }
}

struct Typography_Previews: PreviewProvider {
  static let style1 = Typography(text: "Stop Reading! This is just a test!")
  static let style2 = Typography(
    text: "\"Linux is the supiorer operating system!\"",
    source: "Bill jobs"
  )
  static let style3 = Typography(
    text:
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
    title: "Stop Reading! This is just a test!",
    subtitle: "Fake News Blog"
  )
  static let style4 = Typography(text: "Just an image of my dog!", image: "mochi")

  static var previews: some View {
    ScrollView {
      VStack {
        style1
        style4
        style4
        style4
        style3
        style2
      }
    }
  }
}
