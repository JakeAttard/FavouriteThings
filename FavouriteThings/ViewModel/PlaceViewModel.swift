//
//  LocationViewModel.swift
//  FavouriteThings
//
//  Created by Jake Attard on 6/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import Foundation
import CoreLocation
import MapKit

@objc class Place: NSObject, Identifiable, ObservableObject {
    
    @Published var coordinates = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    @Published var name = ""
    
    var mapCoordinates = CLLocationCoordinate2D(latitude: 0.0, longitude: 0.0)
    
    var latitude: String {
        get { "\(coordinates.latitude)" }
        set {
            guard let coord = CLLocationDegrees(newValue) else { return }
            coordinates.latitude = coord
        }
    }
    
    var longitude: String {
        get { "\(coordinates.longitude)" }
        set {
            guard let coord = CLLocationDegrees(newValue) else { return }
            coordinates.longitude = coord
        }
    }
    
    func updateMapCoordinates() {
        mapCoordinates = coordinates
    }
    
    func updateCoordinatesFromName() {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(name) { (maybePlaceMarks, maybeError) in
            guard let placemark = maybePlaceMarks?.first,
            let location = placemark.location else {
                let description: String
                if let error = maybeError {
                    description = "\(error)"
                } else {
                    description = "<Unkown Error>"
                }
                
                print("Got an error: \(description)")
                return
            }
            
            self.coordinates = location.coordinate
        }
    }
    
    func updateNameFromCoordinates() {
        self.updateMapCoordinates()
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: coordinates.latitude, longitude: coordinates.longitude)
        geocoder.reverseGeocodeLocation(location) { (maybePlaceMarks, maybeError) in
            guard let placemark = maybePlaceMarks?.first else {
                let description: String
                if let error = maybeError {
                    description = "\(error)"
                } else {
                    description = "<Unkown Error>"
                }
                
                print("Got an error: \(description)")
                return
            }
            self.name = placemark.name ?? placemark.administrativeArea ?? placemark.locality ?? placemark.subLocality ?? placemark.thoroughfare ?? placemark.subThoroughfare ?? placemark.country ?? "<Unkown Location Name>"
        }
    }
}

extension Place: MKMapViewDelegate {
    func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
        let centre = mapView.centerCoordinate
        coordinates = centre
        updateMapCoordinates()
    }
}
