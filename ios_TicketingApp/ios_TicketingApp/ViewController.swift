//
//  ViewController.swift
//  ios_TicketingApp
//
//  Created by Clair Kinder on 9/5/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let user = User(username: "TestUser1", password: "1234")
        PersistenceManager.shared.createUser(user: user)
    }


}

