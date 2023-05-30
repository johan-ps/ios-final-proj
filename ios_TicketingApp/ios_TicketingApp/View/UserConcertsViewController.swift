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
    
    @IBAction func goToTicketTESTBtnPressed(_ sender: Any) {
        // Trigger the segue to the account details screen
        performSegue(withIdentifier: "goToTicketTEST", sender: self)
    }

    // Prepare for the segue to the account details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAccountDetails" {
            if let accountDetailsVC = segue.destination as? AccountDetailsViewController {
                accountDetailsVC.currentUser = self.user
            }
            
        }
        else if segue.identifier == "goToTicketTEST"{
            if let ticketVC = segue.destination as? TicketViewController{
                //userConcertsVC.user = self.currentUser ADD BACK IN
            }
        }
        else if segue.identifier == "goToHome"{
            if let homeVC = segue.destination as? ConcertsViewController{
                homeVC.user = self.user
            }
        }
    }
}
