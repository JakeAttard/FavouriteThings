//
//  RowView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) var context
    @ObservedObject var model: FormulaOneDriver
    
    
    var body: some View {
        
        HStack {
            /// Driver Image
            self.model.updateImage()
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
                .shadow(radius: 10).scaledToFit()
            
            /// Formula One Driver Name
            Text(model.nameString)
            
            // Formula One Driver Team
            Text(model.teamString)
                .fontWeight(.light)
                .italic()
                .padding(.leading)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
         
    }
}
