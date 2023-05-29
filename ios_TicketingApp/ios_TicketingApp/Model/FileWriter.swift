//
//  FileWriter.swift
//  ios_TicketingApp
//
//  Created by Matthew Marsh on 29/5/2023.
//

import Foundation

class FileWriter {
    
    var fileURL: URL?
    
    init() {
        // Copy the file from the bundle to the Documents directory
        if let bundleURL = Bundle.main.url(forResource: "UserCredentials", withExtension: "txt") {
            let documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let fileURL = documentsURL.appendingPathComponent("UserCredentials.txt")
            self.fileURL = fileURL
            
            if !FileManager.default.fileExists(atPath: fileURL.path) {
                do {
                    try FileManager.default.copyItem(at: bundleURL, to: fileURL)
                } catch {
                    print("Error: \(error)")
                }
            }
        }
    }
    
    func addUser(user: User) {
        // construct the string to be added
        let userString = "\(user.firstName) | \(user.lastName) | \(user.email) | \(user.password)\n"
        
        // convert the string to Data
        if let data = userString.data(using: .utf8) {
            do {
                // if the file exists, append the data. Otherwise, write the data.
                if let fileURL = self.fileURL, FileManager.default.fileExists(atPath: fileURL.path) {
                    if let fileHandle = try? FileHandle(forWritingTo: fileURL) {
                        fileHandle.seekToEndOfFile()
                        fileHandle.write(data)
                        fileHandle.closeFile()
                    }
                } else {
                    try data.write(to: self.fileURL!)
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
    
    func updateUser(updatedUser: User) {
        if let fileURL = self.fileURL {
            do {
                // Read the file
                let fileContents = try String(contentsOf: fileURL, encoding: .utf8)
                
                // Split the file into lines
                var lines = fileContents.components(separatedBy: "\n")
                
                // Look for the line with the user's email
                for (index, line) in lines.enumerated() {
                    let userComponents = line.components(separatedBy: " | ")
                    
                    if userComponents.count == 4 && userComponents[2] == updatedUser.email {
                        // Found the user to update - replace with updated user
                        let updatedLine = "\(updatedUser.firstName) | \(updatedUser.lastName) | \(updatedUser.email) | \(updatedUser.password)"
                        lines[index] = updatedLine
                        break
                    }
                }
                
                // Join the lines back together and write back to the file
                let updatedFileContents = lines.joined(separator: "\n")
                if let data = updatedFileContents.data(using: .utf8) {
                    try data.write(to: fileURL)
                }
            } catch {
                print("Error: \(error)")
            }
        }
    }
}
