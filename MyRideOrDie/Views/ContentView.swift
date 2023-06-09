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
            ZStack {
                
                if contacts.isEmpty {
                    NoContactsView()
                } else {
                    
                    List {
                        
                        ForEach(contacts) { contact in
                            
                            ZStack(alignment: .leading) {
                                NavigationLink(destination: ContactDetailView(contact: contact)) {
                                    EmptyView()
                                }
                                .opacity(0)
                                
                                ContactRowView(contact: contact)
                                    .swipeActions(allowsFullSwipe: true) {
                                        
                                        Button(role: .destructive) {
                                            do {
                                                try delete(contact)
                                            } catch {
                                                print(error)
                                            }
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                        .tint(.red)
                                        
                                        Button {
                                            
                                        } label: {
                                            Label("Edit", systemImage: "pencil")
                                        }
                                        .tint(.orange)

                                        
                                    }
                            }
                        }
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

private extension ContentView {
    func delete(_ contact: Contact) throws {
        let context = provider.viewContext
        let existingContact = try context.existingObject(with: contact.objectID)
        context.delete(existingContact)
        
        // save the delete on a background thread to commit it
        Task(priority: .background) {
            try await context.perform {
                try context.save()
            }
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
        
        let emptyPreview = ContactsProvider.shared
        ContentView(provider: emptyPreview)
            .environment(\.managedObjectContext, emptyPreview.viewContext)
            .previewDisplayName("Contacts with No Data")
    }
}
