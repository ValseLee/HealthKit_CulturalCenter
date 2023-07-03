//
//  ContentView.swift
//  healthKitCenter
//
//  Created by Celan on 2023/07/03.
//

import SwiftUI
import CareKitUI
import CareKit

struct ContentView: View {
    var body: some View {
        CardView {
            Text("?")
        }
    }
}

public struct CircularCompletionView<Content: View>: View {

    @Environment(\.careKitStyle) private var style

    private var fillColor: Color {
        isComplete ? Color.accentColor : Color(style.color.clear)
    }

    private var background: some View {
        GeometryReader { geo in
            ZStack {
                Circle().fill(self.fillColor)
                Circle().strokeBorder(
                    Color.accentColor,
                    lineWidth: 5
                )
            }
            .inverseMask(self.content)
        }
    }

    private let content: Content
    private let isComplete: Bool

    public var body: some View {
        VStack {
            // The content helps determine the frame, but it does not need to be visible because it will be cut into the circle using an
            // `inverseMask`.
            content.hidden()
        }
        .clipShape(Circle())
        .background(background)
        .font(Font.body.weight(.bold))
    }

    /// Create an instance.
    /// - Parameters:
    ///   - isComplete: The completion state that affects the style of the view.
    ///   - content: The content of the view. The content will be vertically stacked.
    public init(isComplete: Bool, @ViewBuilder content: () -> Content) {
        self.isComplete = isComplete
        self.content = content()
    }
}

#if DEBUG
struct CircularCompletionViewPreviews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack(spacing: 20) {

                CircularCompletionView(isComplete: true) {
                    Text("Complete")
                        .padding()
                        .frame(height: 90)
                }

                CircularCompletionView(isComplete: false) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .padding()
                        .frame(width: 50, height: 50)
                }

                CircularCompletionView(isComplete: true) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .padding()
                        .frame(width: 40, height: 40)
                }

                CircularCompletionView(isComplete: false) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .padding()
                        .frame(width: 30, height: 30)
                }

                CircularCompletionView(isComplete: false) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .padding()
                        .frame(width: 20, height: 20)
                }
            }
        }
    }
}
#endif
