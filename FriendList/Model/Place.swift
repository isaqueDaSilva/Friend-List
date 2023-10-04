//
//  Place.swift
//  FriendList
//
//  Created by Isaque da Silva on 04/10/23.
//

import Foundation
import MapKit

struct Place: Identifiable {
    let id = UUID()
    private var mapItem: MKMapItem
    
    var name: String {
        self.mapItem.name ?? ""
    }
    
    var adress: String {
        let placemark = self.mapItem.placemark
        var cityAndState = ""
        var adress = ""
        
        cityAndState = placemark.locality ?? ""
        if let state = placemark.administrativeArea {
            cityAndState = cityAndState.isEmpty ? state : "\(cityAndState), \(state)"
        }
        
        adress = placemark.subThoroughfare ?? ""
        if let street = placemark.thoroughfare {
            adress = adress.isEmpty ? street : "\(adress), \(street)"
        }
        
        if adress.trimmingCharacters(in: .whitespaces).isEmpty && !cityAndState.isEmpty {
            adress = cityAndState
        }
        
        return adress
    }
    
    var latitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.latitude
    }
    
    var longitude: CLLocationDegrees {
        self.mapItem.placemark.coordinate.longitude
    }
    
    init(mapItem: MKMapItem) {
        self.mapItem = mapItem
    }
}
