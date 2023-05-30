//
//  TicketInformationViewController.swift
//  ios_TicketingApp
//

import Foundation
import UIKit

class TicketInformationViewController:UIViewController{
    var event: Event?
    @IBOutlet var nameLbl: UILabel!
    @IBOutlet var dateLbl: UILabel!
    @IBOutlet var locationLbl: UILabel!
    @IBOutlet var priceLbl: UILabel!
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        nameLbl.text = event?.name
        if let eventDate = event?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: eventDate)
            dateLbl.text = dateString
        }
        locationLbl.text = event?.location
        priceLbl.text = "$\(event?.price ?? 0)"
    }
    @IBAction func buyNowBtn(_ sender: Any) {
        print(event?.name ?? "nill")
        self.performSegue(withIdentifier: "goToTicketPrices", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToTicketPrices" {
            if let VC = segue.destination as? TicketPriceViewController {
                //TicketPriceViewController.user = self.user
                VC.event = event
            }
        }
    }
}
