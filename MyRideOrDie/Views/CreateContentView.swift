//
//  CreateContentView.swift
//  MyRideOrDie
//
//  Created by Frank Bara on 5/18/23.
//

import SwiftUI

struct CreateContentView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        
        List {
            
            Section("General") {
                
                TextField("Name", text: .constant(""))
                    .keyboardType(.namePhonePad)
                
                TextField("Email", text: .constant(""))
                    .keyboardType(.emailAddress)
                
                TextField("Phone Number", text: .constant(""))
                    .keyboardType(.phonePad)
                
                DatePicker("Birthday", selection: .constant(.now), displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                Toggle("Favorite", isOn: .constant(true))
                
            }
            
            Section("Notes") {
                TextField("", text: .constant("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                          axis: .vertical)
            }
        }
        .navigationTitle("Name Here")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
        }
    }
}

struct CreateContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CreateContentView()
        }
    }
}
