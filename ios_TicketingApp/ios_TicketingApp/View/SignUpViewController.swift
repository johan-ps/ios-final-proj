//
//  SignUpViewController.swift
//  ios_TicketingApp
//
//  Created by Emily Kinder on 24/5/2023.
//

import Foundation
import UIKit

class SignUpViewController:UIViewController{
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signUpButtonPressed(_ sender: Any) {
        if firstNameTextField?.text != "" && lastNameTextField?.text != "" && emailTextField?.text != "" && passwordTextField?.text != ""{
            //check if email already exists
            OperationQueue.main.addOperation {
                self.performSegue(withIdentifier: "goToConcertsSignUp", sender: self)
            }
        }
        }
    }

