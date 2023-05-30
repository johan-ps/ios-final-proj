//
//  LoginViewController.swift
//  ios_TicketingApp
//
//  Created by Emily Kinder on 24/5/2023.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let fileReader = FileReader()
        let users: [User] = fileReader.getUsers()

        if emailTextField.text != "" && passwordTextField.text != "" {
            for user in users {
                if user.email == emailTextField.text && user.password == passwordTextField.text {
                    performSegue(withIdentifier: "goToConcertsLogin", sender: user)
                    return
                }
            }
            let alert = UIAlertController(title: "Invalid Input", message: "Email or Password not found", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "This closes alert"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))

            self.present(alert, animated: true, completion: nil)
            emailTextField.text = ""
            passwordTextField.text = ""
        }
        else{
            let alert = UIAlertController(title: "Invalid Input", message: "All fields must be completed", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "This closes alert"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))

            self.present(alert, animated: true, completion: nil)
            return
        }
        
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConcertsLogin" {
            if let concertVC = segue.destination as? ConcertsViewController {
                concertVC.user = sender as? User
            }
        }
    }
}




