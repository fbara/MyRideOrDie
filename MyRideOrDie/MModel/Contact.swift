//
//  Contact.swift
//  MyRideOrDie
//
//  Created by Frank Bara on 5/18/23.
//

import Foundation
import CoreData

final class Contact: NSManagedObject {
    
    @NSManaged var dob: Date
    @NSManaged var email: String
    @NSManaged var isFavorite: Bool
    @NSManaged var name: String
    @NSManaged var notes: String
    @NSManaged var phoneNumber: String
    
    override func awakeFromInsert() {
        super.awakeFromInsert()
        
        setPrimitiveValue(Date.now, forKey: "dob")
        setPrimitiveValue(false, forKey: "isFavorite")
    }
    
}
