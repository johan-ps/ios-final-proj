//
//  User.swift
//  ios_TicketingApp
//
//  Created by Matthew Marsh on 29/5/2023.
//

import Foundation

class User {
    var firstName: String
    var lastName: String
    var email: String
    var password: String
    
    init(firstName: String, lastName: String, email: String, password: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.password = password
    }
    
}
