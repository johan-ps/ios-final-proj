//
//  LoginViewController.swift
//  ios_TicketingApp
//
//  Created by Emily Kinder on 24/5/2023.
//

import Foundation
import UIKit

class LoginViewController:UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToConcertsLogin"{
            if emailTextField.text != "" && passwordTextField.text != "" { //check if fields are null
                //add in logic to check though logins
                let VC = segue.destination as! ConcertsViewController
                let navigationController = UINavigationController(rootViewController: VC)
                self.present(navigationController, animated: true, completion: nil)
            }
        }
    }
}
