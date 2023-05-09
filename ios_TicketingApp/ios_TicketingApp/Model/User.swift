//
//  User.swift
//  ios_TicketingApp
//
//  Created by Johan Priyanth Sebastiampillai on 9/5/2023.
//

import Foundation

struct User: Hashable, Codable {
    let username: String;
    let password: String;
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

struct Users: Codable {
    let items: [User]
}
