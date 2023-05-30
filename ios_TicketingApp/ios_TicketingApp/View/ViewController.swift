//
//  ViewController.swift
//  ios_TicketingApp
//
//  Created by Emily Kinder on 9/5/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToLogin"{ 
            let VC = segue.destination as! LoginViewController
        }
        else if segue.identifier == "goToSignUp"{
            let VC = segue.destination as! SignUpViewController
        }
    }
}

