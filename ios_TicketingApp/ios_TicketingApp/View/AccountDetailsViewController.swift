//
//  AccountDetailsViewController.swift
//  ios_TicketingApp
//

import Foundation
import UIKit

class AccountDetailsViewController: UIViewController {
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    var currentUser: User?  // This should be set before this view controller is presented
    let fileWriter = FileWriter()
    var userConcerts: [Ticket] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateTextFieldsWithUserDetails()
    }
    
    func updateTextFieldsWithUserDetails() {
        guard let user = currentUser else {
            print("No user information available.")
            return
        }
        firstNameTextField.text = user.firstName
        lastNameTextField.text = user.lastName
        emailTextField.text = user.email
        passwordTextField.text = user.password
    }
    
    @IBAction func updateBtnPressed(_ sender: Any) {
        guard let user = currentUser else {
            print("No user information available.")
            return
        }
        
        // Update the current user with the new details
        user.firstName = firstNameTextField.text ?? ""
        user.lastName = lastNameTextField.text ?? ""
        user.email = emailTextField.text ?? ""
        user.password = passwordTextField.text ?? ""
        
        // Use the FileWriter class to update the user details in the file
        fileWriter.updateUser(updatedUser: user)
        
        // Notify the user that their details were updated
        /*let alert = UIAlertController(title: "Success", message: "Your details were updated.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)*/
        
        performSegue(withIdentifier: "goBackToUpcomingGigs", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goBackToUpcomingGigs" {
            if let userConcertsVC = segue.destination as? UserConcertsViewController {
                userConcertsVC.user = self.currentUser
                userConcertsVC.userConcerts = self.userConcerts
            }
        }
        
    }
}
