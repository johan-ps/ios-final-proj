//
//  TicketPriceViewController.swift
//  ios_TicketingApp


import Foundation
import UIKit

class TicketPriceViewController:UIViewController{
    
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var ticketStepper: UIStepper!
    @IBOutlet weak var ticketQuantityLabel: UILabel!
    var event: Event?
    var user: User?
    var userConcerts: [Ticket] = []
    var ticketQuantity: Int = 1
    var totalPrice: Float = 0.0;

    
    override func viewDidLoad(){
        super.viewDidLoad()
        nameLabel.text = event?.name
        if let eventDate = event?.date{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from:eventDate)
            dateLabel.text = dateString
        }
        ticketQuantityLabel.text = "\(ticketQuantity)x tickets @ $\(event?.price ?? 0)"
        totalPriceLabel.text = "$\(event?.price ?? 0)"
        
        ticketStepper.minimumValue = -1.0
        ticketStepper.maximumValue = 1.0
        ticketStepper.value = 0
        ticketStepper.autorepeat = false

    }
    @IBAction func quantityIncrease(_ sender: Any) {
        //if ticketQuantity < 1{
          //  return
        //}
      //  else{
            switch ticketStepper.value {
            case 1.0:
                // add your item here
                ticketQuantity += 1
                ticketStepper.value = 0
                
            default:
                if ticketQuantity >= 2{
                    ticketQuantity -= 1
                    ticketStepper.value = 0
                }
            }
            totalPrice = Float(CGFloat(event!.price) * CGFloat(ticketQuantity))
            totalPriceLabel.text = "\(totalPrice)"
            ticketQuantityLabel.text = "\(ticketQuantity)x tickets @ $\(event?.price ?? 0)"
            
        //}
    }
    @IBAction func confirmBtnPressed(_ sender: Any) {
        if let currentEvent = event{
            let ticket = Ticket(event: currentEvent, quantity: ticketQuantity)
            
            if let currentUser = user{
                currentUser.addTicket(ticket)
                let fileWriter = FileWriter()
                fileWriter.writeUserTickets(user: currentUser)
                print("\(user?.tickets.count)")
                userConcerts.append(ticket)
                
            }
        }
        
        performSegue(withIdentifier: "goToOrderConfirmed", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToOrderConfirmed" {
            if let upcomingGigsVC = segue.destination as? TicketPurchasedViewController {
                upcomingGigsVC.user = self.user
                upcomingGigsVC.userConcerts = self.userConcerts
                upcomingGigsVC.concertName = nameLabel.text ?? ""
                
            }
        }
    }
}
