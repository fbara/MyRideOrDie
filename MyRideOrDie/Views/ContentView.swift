//
//  ContentView.swift
//  MyRideOrDie
//
//  Created by Frank Bara on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingViewContact = false
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach((0...10), id: \.self) { item in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ContactDetailView()) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ContactRowView()
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        isShowingViewContact.toggle()
                    } label: {
                        Image(systemName: "plus")
                            .font(.title2)
                    }
                }
            }
            .sheet(isPresented: $isShowingViewContact) {
                NavigationStack {
                    CreateContentView()
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
