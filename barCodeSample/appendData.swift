//
//  appendData.swift
//  barCodeSample
//
//  Created by Aileen Taboy on 2/26/17.
//  Copyright © 2017 Mike. All rights reserved.
//

import Foundation
import Firebase 



enum UserFields: String {
    
    case email = "email"
    case password = "password"
    case firstName = "firstName"
    case lastName = "lastName"
    case userName = "userName"
    
}


func appendValues(values: Dictionary<String, AnyObject>) {
    
    if let user = FIRAuth.auth()?.currentUser {
        
        let ref = FIRDatabase.database().reference().child("users").child(user.uid)
        print("ref \(ref), values \(values)")
        ref.updateChildValues(values)
        
        
        
    }
    
    
    
    
    
    
}
