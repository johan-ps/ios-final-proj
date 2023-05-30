//
//  TicketPurchasedViewController.swift
//  ios_TicketingApp

import Foundation
import UIKit

class TicketPurchasedViewController:UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMyConcerts" {
            if let accountDetailsVC = segue.destination as? UserConcertsViewController {
                //accountDetailsVC.currentUser = self.user ADD BACK IN
            }
        }
        else if segue.identifier == "goToHome" {
            if let accountDetailsVC = segue.destination as? ConcertsViewController {
                //accountDetailsVC.currentUser = self.user ADD BACK IN
            }
        }
    }
    
    @IBAction func homeBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToHome", sender: self)
    }
    
    
    @IBAction func concertsBtnPressed(_ sender: Any) {
        performSegue(withIdentifier: "goToMyConcerts", sender: self)
    }
    
}
