//
//  CreateContentView.swift
//  MyRideOrDie
//
//  Created by Frank Bara on 5/18/23.
//

import SwiftUI

struct CreateContentView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: EditContactViewModel
    
    
    var body: some View {
        
        List {
            
            Section("General") {
                
                TextField("Name", text: $vm.contact.name)
                    .keyboardType(.namePhonePad)
                
                TextField("Email", text: $vm.contact.email)
                    .keyboardType(.emailAddress)
                
                TextField("Phone Number", text: $vm.contact.phoneNumber)
                    .keyboardType(.phonePad)
                
                DatePicker("Birthday", selection: $vm.contact.dob, displayedComponents: [.date])
                    .datePickerStyle(.compact)
                
                Toggle("Favorite", isOn: $vm.contact.isFavorite)
                
            }
            
            Section("Notes") {
                TextField("", text: $vm.contact.notes,
                          axis: .vertical)
            }
        }
        .navigationTitle("Name Here")
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Done") {
                    do {
                        try vm.save()
                        dismiss()
                    } catch {
                        print(error)
                    }
                    
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
            CreateContentView(vm: .init(provider: .shared))
        }
    }
}
