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
        navigationController?.isNavigationBarHidden = false
    }
    
    @IBAction func accountDetailsBtnPressed(_ sender: Any) {
        // Trigger the segue to the account details screen
        performSegue(withIdentifier: "goToAccountDetails", sender: self)
    }

    // Prepare for the segue to the account details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAccountDetails" {
            if let accountDetailsVC = segue.destination as? AccountDetailsViewController {
                accountDetailsVC.currentUser = self.user
            }
        }
    }
}
