//
//  GPSHandler.swift
//  PetGame
//
//  Created by Fukumoto Jared A. on 4/11/19.
//  Copyright © 2019 Rennick Carter M. All rights reserved.
//

import Foundation
import CoreLocation

class GPSHandler : NSObject, CLLocationManagerDelegate {
    var locationManager : CLLocationManager
    var lat : Double
    var lon : Double
    var speed : Double
    
    static let instance = GPSHandler()
    
    override init(){
        locationManager = CLLocationManager()
        lat = 0
        lon = 0
        speed = 0
        super.init()
    }
    
    func enableLocationServices() {
        locationManager.delegate = self
        
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        guard let first = locations.first else {
            return
        }
        lat = first.coordinate.latitude
        lon = first.coordinate.longitude
        speed = first.speed.magnitude
    }
}
