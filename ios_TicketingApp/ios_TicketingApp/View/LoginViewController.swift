//
//  LoginViewController.swift
//  ios_TicketingApp
//
//  Created by Emily Kinder on 24/5/2023.
//

import Foundation
import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loginButtonPressed(_ sender: Any) {
        if emailTextField.text != "" && passwordTextField.text != "" { //check if fields are null
            //add in logic to check though logins
            OperationQueue.main.addOperation {
                self.performSegue(withIdentifier: "goToConcertsLogin", sender: self)
            }
        }
    }
}




