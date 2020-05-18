//
//  KeyboardResponsive.swift
//  FavouriteThings
//
//  Created by Jake Attard on 5/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import Foundation
import SwiftUI

/// Struct is called as it modifies the view content
struct Keyboard: ViewModifier {

    /// variable offset is set to CoreGraphics float
    @State var offset: CGFloat = 0

    func body (content: Content) -> some View {
        content.padding(.bottom, offset).onAppear {
            /// Keyboard shows and offsets the screen from the keyboard
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                /// Unwraps the value from the keyboard frame
                guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                let height = value.height
                self.offset = height
            }
            /// Keyboard disappears and resets the offset back to 0
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (notification) in
                self.offset = 0
            }
        }
    }
}
