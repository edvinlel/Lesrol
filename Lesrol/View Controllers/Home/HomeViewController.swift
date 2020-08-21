//
//  HomeViewController.swift
//  Lesrol
//
//  Created by Edvin Lellhame on 8/3/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    weak var homeView: HomeView! { return self.view as? HomeView }
    
    var jordan: User!
    var joey: User!
    var edvin: User!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = HomeView()
        
        homeView.tableView.register(TripCell.self, forCellReuseIdentifier: TripCell.upcomingReuseId)
        
        
        homeView.tableView.register(YourTripTableViewCell.self, forCellReuseIdentifier: "YourTripTableViewCell")
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        
        // Dummy Data
        edvin = User(email: "", password: "", dateCreated: "", followers: [], username: "Edvin Lellhame", profileImage: UIImage(named: "edvin")!)
        joey = User(email: "test@gmail.com", password: "", dateCreated: "", followers: [], username: "Joey Perera", profileImage: UIImage(named: "joey")!)
        let user2 = User(email: "", password: "", dateCreated: "", followers: [], username: "", profileImage: nil)
        let user3 = User(email: "", password: "", dateCreated: "", followers: [], username: "", profileImage: nil)
        
        var jordan = User(email: "test@gmail.com", password: "123456", dateCreated: "July 1", followers: [], username: "Jordan Lellhame", profileImage: UIImage(named: "jordan"))
        
        let location = Location(title: "Jessie M. Honeyman Memorial State Park Campground", address: "84505 Oregon Coast Hwy S, Florence, OR 97439", coordinate: nil)
        
        let oregonTrip = Trip(backgroundImage: UIImage(named: "camping")!, user: jordan, title: "Oregon Camping", description: "Quarantine getaway. All is welcome. ‘Merica.", totalGuests: 11, startDate: "July 28", endDate: "Aug 4", location: location, confirmedGuests: [edvin, joey, user2, user3], invitedGuests: nil, isPublic: false)
        
        
        jordan.createdTrips.append(oregonTrip)
        self.jordan = jordan
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }

    

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return jordan.createdTrips.count
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "YourTripTableViewCell", for: indexPath) as! YourTripTableViewCell
            let trips = jordan.createdTrips[indexPath.row]
            
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: TripCell.upcomingReuseId, for: indexPath) as! TripCell
            let trip = jordan.createdTrips[indexPath.row]
            cell.setCell(withTrip: trip)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var trip: Trip!
        switch indexPath.section {
        case 0:
            
            let currentTrip = jordan.createdTrips[indexPath.row]
            trip = currentTrip
        case 1:
            let invitedTrip = jordan.createdTrips[indexPath.row]
            trip = invitedTrip
        default:
            fatalError()
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 180
        }
        
        return 420
    }
    
    
    
}
