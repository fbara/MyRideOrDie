//
//  NoContactView.swift
//  MyRideOrDie
//
//  Created by Frank Bara on 5/20/23.
//

import SwiftUI

struct NoContactsView: View {
    var body: some View {
        VStack {
            Text("👀 No Contacts")
                .font(.largeTitle.bold())
            Text("It seems a lil' empty here, create some contacts!")
                .font(.callout)
        }
        
        
    }
}

struct NoContactView_Previews: PreviewProvider {
    static var previews: some View {
        NoContactsView()
    }
}
