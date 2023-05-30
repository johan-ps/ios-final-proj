//
//  ConcertsViewController.swift
//  ios_TicketingApp
//
//  Created by Clair Kinder on 24/5/2023.
//

import Foundation
import UIKit

class ConcertsViewController:UIViewController, UITableViewDataSource, UITableViewDelegate {
    var user: User?
    var events = FileReader.getEvents()
    @IBOutlet var concertsTblView: UITableView!
    @IBOutlet var welcomeLbl: UILabel!
    @IBOutlet weak var logOutBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)

        if let unwrapped = user {
            let name = unwrapped.firstName.uppercased()
            welcomeLbl.text = "HEY \(name)"
        }

        concertsTblView.dataSource = self
        concertsTblView.delegate = self
    }

    @IBAction func logOutBtnPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToMenu", sender: self)
    }

    @IBAction func userConcertsBtnPressed(_ sender: Any) {
        self.performSegue(withIdentifier: "goToUpcomingGigs", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToUpcomingGigs" {
            if let upcomingGigsVC = segue.destination as? UserConcertsViewController {
                upcomingGigsVC.user = self.user
            }
        }
        else if segue.identifier == "goToEventDetail" {
            if let eventDetailVC = segue.destination as? TicketInformationViewController, let event = sender as? Event {
                eventDetailVC.event = event
                eventDetailVC.user = self.user
            }
        }
        else if segue.identifier == "goToMenu"{
            let menuVC = segue.destination as? ViewController
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
        let event = events[indexPath.row]

        cell.textLabel?.text = "\(event.name)   $\(String(event.price))"
        return cell
    }


    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let event = events[indexPath.row]

        performSegue(withIdentifier: "goToEventDetail", sender: event)
    }

}
