//
//  KeyboardResponsive.swift
//  FavouriteThings
//
//  Created by Jake Attard on 5/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI
struct Keyboard: ViewModifier {

    @State var offset: CGFloat = 0

    func body (content: Content) -> some View {
        content.padding(.bottom, offset).onAppear {
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { (notification) in
                guard let value = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect else { return }
                let height = value.height
                self.offset = height
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardDidHideNotification, object: nil, queue: .main) { (notification) in
                self.offset = 0
            }
        }
    }
}
