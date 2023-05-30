//
//  UserConcertsViewController.swift
//  ios_TicketingApp
//
//
//

import Foundation
import UIKit

class UserConcertsViewController: UIViewController {
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    @IBAction func accountDetailsBtnPressed(_ sender: Any) {
        // Trigger the segue to the account details screen
        performSegue(withIdentifier: "goToAccountDetails", sender: self)
    }

    // Prepare for the segue to the account details screen
    @IBAction func homePageBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToHomePageUser", sender: self)
    }
    
}
