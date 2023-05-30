//
//  SignUpViewController.swift
//  ios_TicketingApp
//
//  Created by Emily Kinder on 24/5/2023.
//

import Foundation
import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let fileReader = FileReader()
        let users = fileReader.getUsers()
        var flag = true
        for user in users{
            if user.email == emailTextField.text {
                flag = false
            }
        }
        if let firstName = firstNameTextField?.text,
           let lastName = lastNameTextField?.text,
           let email = emailTextField?.text,
           let password = passwordTextField?.text,
           !firstName.isEmpty,
           !lastName.isEmpty,
           !email.isEmpty,
           !password.isEmpty,
           flag{
            
            let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password)
            let fileWriter = FileWriter()
            fileWriter.addUser(user: newUser)
            
            performSegue(withIdentifier: "goToConcertsSignUp", sender: newUser)
        }
        firstNameTextField.text = ""
        lastNameTextField.text = ""
        emailTextField.text = ""
        passwordTextField.text = ""
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConcertsSignUp" {
            if let concertVC = segue.destination as? ConcertsViewController {
                concertVC.user = sender as? User
            }
        }
    }
}
