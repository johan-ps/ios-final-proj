//
//  UserConcertsViewController.swift
//  ios_TicketingApp
//
//
//

import Foundation
import UIKit

class UserConcertsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    var user: User?
   // let fileReader = FileReader()
    var userConcerts: [Ticket] = []
    
    
    @IBOutlet var userConcertsTblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: true)
        
        userConcertsTblView.dataSource = self
        userConcertsTblView.delegate = self
        //userConcerts = fileReader.getUserTickets(user: user!)
       // print("\(userConcerts.count)")
        // Load the user's concerts/tickets
       // addUserConcerts()
        //print("\(userConcerts.count)")

        userConcertsTblView.reloadData()
        
        //print("\(user?.firstName)")
    }
    
    func addUserConcerts(){
        let fileReader = FileReader()
        if let currentUser = user{
            userConcerts = fileReader.getUserTickets(user: currentUser)
        }
    }
    @IBAction func accountDetailsBtnPressed(_ sender: Any) {
        // Trigger the segue to the account details screen
        performSegue(withIdentifier: "goToAccountDetails", sender: self)
    }
    
    @IBAction func goToTicketTESTBtnPressed(_ sender: Any) {
        // Trigger the segue to the account details screen
 
        performSegue(withIdentifier: "goToTicketTEST", sender: self)
    }
    
    @IBAction func goToHomeBtnPressed(_ sender: Any) {
        // Trigger the segue to the account details screen
        performSegue(withIdentifier: "goToHome", sender: self)
    }

    // Prepare for the segue to the account details screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToAccountDetails" {
            if let accountDetailsVC = segue.destination as? AccountDetailsViewController {
                accountDetailsVC.currentUser = self.user
                accountDetailsVC.userConcerts = self.userConcerts

            }
            
        }
        else if segue.identifier == "goToTicketTEST"{
            if let ticketVC = segue.destination as? TicketViewController{
                //userConcertsVC.user = self.currentUser ADD BACK IN
                ticketVC.userConcerts = self.userConcerts

            }
        }
        else if segue.identifier == "goToHome"{
            if let homeVC = segue.destination as? ConcertsViewController{
                homeVC.user = self.user
                homeVC.userConcerts = self.userConcerts

            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        userConcerts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userConcertsCell", for: indexPath)
        
        let concert = userConcerts[indexPath.row]
        
        cell.textLabel?.text = concert.event.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ticket = userConcerts[indexPath.row]

        performSegue(withIdentifier: "goToEventDetail", sender: ticket)
    }
}
