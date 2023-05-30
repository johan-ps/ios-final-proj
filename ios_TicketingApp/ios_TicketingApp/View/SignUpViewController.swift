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
        passwordTextField.isSecureTextEntry = true
        
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        let fileReader = FileReader()
        let users = fileReader.getUsers()
        var flag = true
        for user in users{
            if user.email == emailTextField.text {
                flag = false

                    let alert = UIAlertController(title: "Email already in use", message: "Enter a new email or login", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "This closes alert"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                    }))

                    self.present(alert, animated: true, completion: nil)
                    return
                
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
            if(!isValidEmail(email)){
                let alert = UIAlertController(title: "Invalid Input", message: "Email format not valid", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "This closes alert"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                
                self.present(alert, animated: true, completion: nil)
                return
            }
            else{
                let newUser = User(firstName: firstName, lastName: lastName, email: email, password: password)
                let fileWriter = FileWriter()
                fileWriter.addUser(user: newUser)
                
                performSegue(withIdentifier: "goToConcertsSignUp", sender: newUser)
            }
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "All fields must be completed", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "This closes alert"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))

            self.present(alert, animated: true, completion: nil)
            return
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
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
