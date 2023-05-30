//
//  TicketViewController.swift
//  ios_TicketingApp
//
//  Created by Clair Kinder on 23/5/2023.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var concertNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    var thisConcert: Ticket?
    var userConcerts: [Ticket] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        concertNameLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        dateLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        quantityLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        locationLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        concertNameLabel.text = thisConcert?.eventName
        locationLabel.text = thisConcert?.location
        if let eventDate = thisConcert?.date {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd/MM/yyyy"
            let dateString = dateFormatter.string(from: eventDate)
            dateLabel.text = dateString
        }
        quantityLabel.text = ("General Admission x\(thisConcert?.quantity)")
        

        // Do any additional setup after loading the view.
    }


}
