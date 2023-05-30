//
//  TicketPurchasedViewController.swift
//  ios_TicketingApp

import Foundation
import UIKit

class TicketPurchasedViewController:UIViewController{
    override func viewDidLoad(){
        self.navigationItem.setHidesBackButton(true, animated: true)
        super.viewDidLoad()
        super.navigationController?.isNavigationBarHidden = false

    }
}
