//
//  ConcertsViewController.swift
//  ios_TicketingApp
//
//  Created by Clair Kinder on 24/5/2023.
//

import Foundation
import UIKit

class ConcertsViewController:UIViewController{
    var user: User?
    @IBOutlet var welcomeLbl: UILabel!
    @IBOutlet weak var logOutBtn: UIButton!
    override func viewDidLoad(){
        super.viewDidLoad()
        super.navigationController?.isNavigationBarHidden = false
        
        if let unwrapped = user {
            let name = unwrapped.firstName.uppercased()
            welcomeLbl.text = "HEY \(name)"
        }

    }
    
    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        
    }

    @IBAction func concertsBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToUpcomingGigs", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToUpcomingGigs" {
                if let upcomingGigsVC = segue.destination as? UserConcertsViewController {
                    upcomingGigsVC.user = self.user
                }
            }
        }
}
