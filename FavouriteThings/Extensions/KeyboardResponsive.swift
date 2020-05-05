//
//  KeyboardResponsive.swift
//  FavouriteThings
//
//  Created by Jake Attard on 5/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

extension View {
    func onKeyboard(_ keyboardYOffset: Binding<CGFloat>) -> some View {
        return ModifiedContent(content: self, modifier: KeyboardModifier(keyboardYOffset))
    }
}

struct KeyboardModifier: ViewModifier {
    @Binding var keyboardYOffset: CGFloat
    let keyboardWillAppearPublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
    let keyboardWillHidePublisher = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)

    init(_ offset: Binding<CGFloat>) {
        _keyboardYOffset = offset
    }

    func body(content: Content) -> some View {
        return content.offset(x: 0, y: -$keyboardYOffset.wrappedValue)
            .animation(.easeInOut(duration: 0.33))
            .onReceive(keyboardWillAppearPublisher) { notification in
                let keyWindow = UIApplication.shared.connectedScenes
                    .filter { $0.activationState == .foregroundActive }
                    .map { $0 as? UIWindowScene }
                    .compactMap { $0 }
                    .first?.windows
                    .filter { $0.isKeyWindow }
                    .first

                let yOffset = keyWindow?.safeAreaInsets.bottom ?? 0

                let keyboardFrame = (notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue ?? .zero

                self.$keyboardYOffset.wrappedValue = keyboardFrame.height - yOffset
        }.onReceive(keyboardWillHidePublisher) { _ in
            self.$keyboardYOffset.wrappedValue = 0
        }
    }
}
