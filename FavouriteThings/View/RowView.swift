//
//  RowView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 17/4/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import SwiftUI

struct RowView: View {
    /// Getting the context from the @Environment managedObjectContext
    @Environment(\.managedObjectContext) var context
    
    /// Calling the FormulaOneDriver in a new variable called model
    @ObservedObject var model: FormulaOneDriver
    
    
    var body: some View {
        
        HStack {
            /// Formula One Driver Image
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
