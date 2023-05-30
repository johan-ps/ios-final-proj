//
//  Event.swift
//  ios_TicketingApp
//
//  Created by Matthew Marsh on 30/5/2023.
//

import Foundation

class Event {
    var name: String
    var date: Date
    var price: Double
    var location: String
    
    init(name: String, date: Date, price: Double, location: String) {
        self.name = name
        self.date = date
        self.price = price
        self.location = location
    }
}
