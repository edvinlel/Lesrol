//
//  PostViewController.swift
//  Trips
//
//  Created by Edvin Lellhame on 6/28/20.
//  Copyright © 2020 Edvin Lellhame. All rights reserved.
//

import UIKit
import MapboxGeocoder
import MapKit

class PostViewController: UIViewController  {
    
    
    
    // MARK: Properties
    
    weak var postView: PostView! { return self.view as? PostView }
    var placemark: GeocodedPlacemark!
    var swipeGesture: UISwipeGestureRecognizer!
    
    var containerHeight: CGFloat = 500
    var questionHeight: CGFloat = 100
    var blueprintHeight: CGFloat = 100
    

    // MARK: ViewLifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        view = PostView()
        
        navigationController?.navigationBar.barTintColor = .white
        view.backgroundColor = UIColor(white: 0, alpha: 0.6)
        title = "Add Title"
        
        postView.tripDescriptionTextField.delegate = self
        
        
        swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(swipeDownDismissView))
        swipeGesture.direction = .down
        postView.mainContainerView.addGestureRecognizer(swipeGesture)
        
        postView.mapContainerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(locationTapped)))
        postView.cancelImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(cancelViewTapped)))
        postView.switchControl.addTarget(self, action: #selector(switchToggled), for: .valueChanged)
        
        
        postView.friendsCollectionView.register(FriendCell.self, forCellWithReuseIdentifier: FriendCell.reuseIdentifer)
        postView.friendsCollectionView.delegate = self
        postView.friendsCollectionView.dataSource = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        ConstraintAnimation.addContainerCachedConstraints = ConstraintAnimation.animateView(with: ConstraintAnimation.addContainerCachedConstraints, for: postView.mainContainerView, in: postView, withHeight: 600, forDuration: 0.4)
    }

    // MARK: Helper Methods
    
    func getDataBack(placemark: GeocodedPlacemark) {
        self.placemark = placemark
        postView.mapLabel.text = placemark.name
    }
    
    
    // MARK: Targets
    
    @objc private func switchToggled(switchControl: UISwitch) {
        print(view.frame.size.height)
        
        if !switchControl.isOn {
            
            ConstraintAnimation.addContainerCachedConstraints = ConstraintAnimation.animateView(with: ConstraintAnimation.addContainerCachedConstraints, for: postView.mainContainerView, in: postView, withHeight: view.frame.size.height, forDuration: 0.4)
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                self.postView.activateCollectionView(flag: true)
            }
            
            
        } else  {
            
            ConstraintAnimation.addContainerCachedConstraints = ConstraintAnimation.animateView(with: ConstraintAnimation.addContainerCachedConstraints, for: postView.mainContainerView, in: postView, withHeight: 600, forDuration: 0.4)
            
            postView.activateCollectionView(flag: false)
            
        }
    }
    
    @objc private func cancelViewTapped() {
        swipeViewDown()
    }
    
    @objc private func locationTapped() {
        let locationVC = SearchViewController()
        locationVC.modalPresentationStyle = .fullScreen
        present(locationVC, animated: false, completion: nil)
    }

    @objc private func swipeDownDismissView() {
        swipeViewDown()
        
    }
    
    private func swipeViewDown() {
        if swipeGesture.direction == .down {
            ConstraintAnimation.addContainerCachedConstraints = ConstraintAnimation.animateView(with: ConstraintAnimation.addContainerCachedConstraints, for: postView.mainContainerView, in: postView, withHeight: 0, forDuration: 0.4)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard annotation is MKPointAnnotation else { return nil }

        let identifier = "Annotation"
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)

        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView!.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }

        return annotationView
    }

}

extension PostViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if !textView.text.isEmpty {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Placeholder"
            textView.textColor = UIColor.TripsColor.paragraphGray
        }
    }
}


extension PostViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 22
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FriendCell.reuseIdentifer, for: indexPath) as! FriendCell
        
        cell.setCell()
    
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! FriendCell
        cell.profileImageView.layer.borderColor = UIColor.black.cgColor
        cell.profileImageView.layer.borderWidth = 2
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let yourWidth = collectionView.bounds.width/4.0 
        let yourHeight = yourWidth

        return CGSize(width: yourWidth, height: yourHeight)
    }
}
