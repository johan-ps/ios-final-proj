//
//  PersistenceManager.swift
//  ios_TicketingApp
//
//  Created by Johan Priyanth Sebastiampillai on 9/5/2023.
//

import Foundation

class PersistenceManager {
    static let shared = PersistenceManager()
    
    private init() {}
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        print(documentsDirectory)
        return documentsDirectory
    }
    
    func createUser(user: User) {
        let path = documentsDirectory().appendingPathComponent("users.plist")
        let plistEncoder = PropertyListEncoder()
        plistEncoder.outputFormat = .xml
        let encoded = try! plistEncoder.encode(user)
        try! encoded.write(to: path)
    }
}
