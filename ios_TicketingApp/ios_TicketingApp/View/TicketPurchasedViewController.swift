//
//  TicketPurchasedViewController.swift
//  ios_TicketingApp

import Foundation
import UIKit

class TicketPurchasedViewController:UIViewController{
    var user: User?
    var userConcerts: [Ticket] = []
    var concertName: String = ""
    @IBOutlet weak var concertNameLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        concertNameLabel.text = "\(concertName)"
        self.navigationItem.setHidesBackButton(true, animated: true)
        //print("\(user?.tickets.count)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToMyConcerts" {
            if let accountDetailsVC = segue.destination as? UserConcertsViewController {
                accountDetailsVC.user = self.user //ADD BACK IN
                accountDetailsVC.userConcerts = self.userConcerts
            }
        }
        else if segue.identifier == "goToHome" {
            if let accountDetailsVC = segue.destination as? ConcertsViewController {
                accountDetailsVC.user = self.user
                accountDetailsVC.userConcerts = self.userConcerts
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
