//
//  FormulaOneDriverDelegateExtension.swift
//  FavouriteThings
//
//  Created by Jake Attard on 18/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//
import MapKit
import CoreLocation
import Foundation
import UIKit

/// Updates the coordinates latitude and longitude from the centre of the map
extension FormulaOneDriverMapViewDelegate: MKMapViewDelegate {
    /// Coordinates updated when the map has stopped moving
    public func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        /// Retrieving the coordinate values
        let centre = mapView.centerCoordinate
        setMapCoords(newCoords: centre)
    }
}
