//
//  TicketViewController.swift
//  ios_TicketingApp
//
//  Created by Clair Kinder on 23/5/2023.
//

import UIKit

class TicketViewController: UIViewController {

    @IBOutlet weak var ticketDetailsStack: UIStackView!
    @IBOutlet weak var concertNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!
    
    override func viewDidLoad() {
        concertNameLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        dateLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        quantityLabel.transform = CGAffineTransformMakeRotation(.pi / 2)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


}
