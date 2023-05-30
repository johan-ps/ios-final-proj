//
//  Ticket.swift
//  ios_TicketingApp
//
//  Created by Matthew Marsh on 30/5/2023.
//

import Foundation

class Ticket {
    let event: Event
    var quantity: Int
    
    init(event: Event, quantity: Int) {
        self.event = event
        self.quantity = quantity
    }
    
    var eventName: String {
        return event.name
    }

    var price: Double {
        return event.price
    }
    
    var location: String {
        return event.location
    }
    
    var date: Date {
        return event.date
    }
}
