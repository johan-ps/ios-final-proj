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
}
