//
//  SearchViewController.swift
//  Trips
//
//  Created by Edvin Lellhame on 7/30/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import MapboxGeocoder

protocol ViewControllerBDelegate : class {
    func getDataBack(placemark : GeocodedPlacemark) -> ()
}

class SearchViewController: UIViewController {
    
    // MARK: Views
    
    let backButton: UIImageView = {
        let button = UIImageView()
        button.contentMode = .scaleAspectFill
        button.isUserInteractionEnabled = true
        button.image = UIImage(named: "back")
        return button
    }()
    
    let searchBar: UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search"
        search.barStyle = .default
        search.searchBarStyle = .minimal
        search.backgroundImage = UIImage()
        return search
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.TripsColor.paragraphGray
        view.alpha = 0.2
        return view
    }()
    
    let searchTableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = 60
        return tableView
    }()
    
    
    
    // MARK: Properties
    
    var searchAutocomplete = [GeocodedPlacemark]()
    let geocoder = Geocoder(accessToken: "pk.eyJ1IjoiZWR2aW5sZWwiLCJhIjoiY2tkOWNmMXowMDE1bTM0dDFmaWNnaWtpeSJ9.XNfLqCayuDisI8S9C1s1-g")
    weak var delegate: ViewControllerBDelegate?

    // MARK: ViewLifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        view.setSubviewsForAutoLayout([backButton, searchBar, dividerView, searchTableView])
        
        setConstraints()
        
        searchBar.delegate = self
        
        searchTableView.register(SearchCell.self, forCellReuseIdentifier: SearchCell.reuseId)
        searchTableView.delegate = self
        searchTableView.dataSource = self
        
        searchBar.becomeFirstResponder()
        
        setTargets()
    }
    
    // MARK: Targets
    
    private func setTargets() {
        backButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(backButtonPressed)))
    }
    
    @objc private func backButtonPressed() {
        dismiss(animated: true, completion: nil)
        navigationController?.popViewController(animated: false)
    }
    
    // MARK: Constraints
    
    private func setConstraints() {
        /// Back Button
        NSLayoutConstraint.activate([
            backButton.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 15),
            backButton.widthAnchor.constraint(equalToConstant: 10)
        ])
        
        /// Search Bar
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.topAnchor, constant: 35),
            searchBar.leftAnchor.constraint(equalTo: backButton.rightAnchor, constant: 20),
            searchBar.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 80)
        ])
       
        /// Divider View
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 0),
            dividerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            dividerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            dividerView.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        /// TableView
        NSLayoutConstraint.activate([
            searchTableView.topAnchor.constraint(equalTo: dividerView.bottomAnchor, constant: 10),
            searchTableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            searchTableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            searchTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }


}

extension SearchViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let options = ForwardGeocodeOptions(query: searchText)
        options.autocompletesQuery = true
        options.maximumResultCount = 10

        searchAutocomplete.removeAll()
        searchTableView.reloadData()
        
        let task = geocoder.geocode(options) { (placemarks, attribution, error) in
            guard let placemark = placemarks?.first else {
                return
            }

//            print(placemark.name)
            guard let placemarks = placemarks else { return }
                // 200 Queen St
//            print(placemark.qualifiedName)
                // 200 Queen St, Saint John, New Brunswick E2L 2X1, Canada
            for i in placemarks {
                DispatchQueue.main.async {
                    self.searchAutocomplete.append(i)
                    self.searchTableView.reloadData()
                }
                
            }


            #if !os(tvOS)
                let formatter = CNPostalAddressFormatter()
//                print(formatter.string(from: placemark.postalAddress!))
                    // 200 Queen St
                    // Saint John New Brunswick E2L 2X1
                    // Canada
            #endif
        }
    }
    
    
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchAutocomplete.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchCell.reuseId, for: indexPath) as! SearchCell
        let placemark = searchAutocomplete[indexPath.row]
        
        cell.setCell(placemark: placemark)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let placemark = searchAutocomplete[indexPath.row]
        delegate?.getDataBack(placemark: placemark)
        dismiss(animated: false, completion: nil)
    }
}
