//
//  ContentView.swift
//  MyRideOrDie
//
//  Created by Frank Bara on 5/17/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isShowingViewContact = false
    
    @FetchRequest(fetchRequest: Contact.all()) private var contacts
    
    var provider = ContactsProvider.shared
    
    var body: some View {
        
        NavigationStack {
            List {
                
                ForEach(contacts) { contact in
                    
                    ZStack(alignment: .leading) {
                        NavigationLink(destination: ContactDetailView(contact: contact)) {
                            EmptyView()
                        }
                        .opacity(0)
                        
                        ContactRowView(contact: contact)
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
                    CreateContentView(vm: .init(provider: provider))
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let preview = ContactsProvider.shared
        ContentView(provider: preview)
            .environment(\.managedObjectContext, preview.viewContext)
            .previewDisplayName("Contacts with Data")
            .onAppear { Contact.makePreview(count: 10, in: preview.viewContext) }
    }
}
