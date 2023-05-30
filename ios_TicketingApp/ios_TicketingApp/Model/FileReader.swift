//
//  FileReader.swift
//  ios_TicketingApp
//
//  Created by Matthew Marsh on 29/5/2023.
//

import Foundation

class FileReader {
    var users: [User]
    
    init(){
        users = []
    }
    
    func getUsers() -> [User] {
        let filename = "UserCredentials"
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("\(filename).txt")

        do {
            let text = try String(contentsOf: fileURL, encoding: .utf8)
            let userCredStrings = text.components(separatedBy: "\n")
            for credString in userCredStrings {
                let userPass = credString.components(separatedBy: " | ")
                if userPass.count == 4 {
                    let user = User(firstName: userPass[0], lastName: userPass[1], email: userPass[2], password: userPass[3])
                    users.append(user)
                }
            }
        } catch {
            print("Failed to read file: \(error)")
        }
        
        return users
    }
    
    static func getEvents() -> [Event] {
        let filename = "Events"
        let fileURL = Bundle.main.url(forResource: filename, withExtension: "txt")

        var events: [Event] = []

        do {
            let text = try String(contentsOf: fileURL!, encoding: .utf8)
            let eventStrings = text.components(separatedBy: "\n")
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd-MM-yyy"  // Adjust this to match the format of dates in your file

            for eventString in eventStrings {
                let eventComponents = eventString.components(separatedBy: " | ")
                if eventComponents.count == 4,
                   let date = dateFormatter.date(from: eventComponents[1]),
                   let price = Double(eventComponents[2]) {
                    let event = Event(name: eventComponents[0], date: date, price: price, location: eventComponents[3])
                    events.append(event)
                }
            }
        } catch {
            print("Failed to read file: \(error)")
        }
        
        return events
    }
    
    func getUserTickets(user: User) -> [Ticket] {
        let filename = "\(user.email)_Tickets"
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileURL = documentsURL.appendingPathComponent("\(filename).txt")
        
        var tickets: [Ticket] = []
        
        do {
            let text = try String(contentsOf: fileURL, encoding: .utf8)
            let ticketStrings = text.components(separatedBy: "\n")
            
            for ticketString in ticketStrings {
                let ticketComponents = ticketString.components(separatedBy: " | ")
                
                if ticketComponents.count == 5,
                   let eventDate = DateFormatter().date(from: ticketComponents[1]),
                   let eventPrice = Double(ticketComponents[3]),
                   let ticketQuantity = Int(ticketComponents[4]) {
                    
                    let event = Event(name: ticketComponents[0], date: eventDate, price: eventPrice, location: ticketComponents[2])
                    let ticket = Ticket(event: event, quantity: ticketQuantity)
                    tickets.append(ticket)
                }
            }
        } catch {
            print("Failed to read file: \(error)")
        }
        
        return tickets
    }
}
