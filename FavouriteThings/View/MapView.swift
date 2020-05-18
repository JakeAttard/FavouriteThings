//
//  MapView.swift
//  FavouriteThings
//
//  Created by Jake Attard on 6/5/20.
//  Copyright © 2020 Jake Attard. All rights reserved.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    
    /// Calling new variable model from FormulaOneDriverMapViewDelegate object
    @ObservedObject var model: FormulaOneDriverMapViewDelegate
    
    /// Displaying the MapUI
    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView(frame: .zero)
        mapView.delegate = model
        return mapView
    }
    
    /// Updating the MapUI
    func updateUIView(_ mapView: MKMapView, context: Context) {
        let region = MKCoordinateRegion(center: model.getMapCoords(), latitudinalMeters: 10_000, longitudinalMeters: 10_000)
        mapView.setRegion(region, animated: false)
    }
}
