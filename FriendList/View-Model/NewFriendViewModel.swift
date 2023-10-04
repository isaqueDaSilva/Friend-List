//
//  NewFriendViewModel.swift
//  FriendList
//
//  Created by Isaque da Silva on 29/09/23.
//

import Foundation
import MapKit
import SwiftUI

extension NewFriendView {
    class NewFriendViewModel: ObservableObject {
        let coreDataManager = FriendManager.shared
        let locationManager = LocationManager()
        
        @Published var name = ""
        @Published var placeName = ""
        @Published var date = Date.now
        @Published var image: Image?
        @Published var inputImage: UIImage?
        @Published var places = [Place]()
        @Published var showingImagePicker = false
        @Published var isSearchPlaceOn = true
        
        var onSave: () -> Void
        
        func loadImage() {
            guard let inputImage = inputImage else { return }
            DispatchQueue.main.async {
                self.image = Image(uiImage: inputImage)
            }
        }
        
        func addNewFriend() {
            Task {
                let newFriend = Friend(context: coreDataManager.context)
                newFriend.id = UUID()
                newFriend.name = self.name
                newFriend.friendPhoto = self.inputImage
                newFriend.place = self.placeName
                newFriend.date = self.date
                if let place = places.first {
                    newFriend.latitude = place.latitude
                    newFriend.longitude = place.longitude
                }
                await coreDataManager.save()
                DispatchQueue.main.async {
                    self.onSave()
                }
            }
        }
        
        func search() {
            let searchRequest = MKLocalSearch.Request()
            searchRequest.naturalLanguageQuery = placeName
            searchRequest.region = locationManager.region
            let search = MKLocalSearch(request: searchRequest)
            
            search.start { response, error in
                guard let response = response else { return }
                
                DispatchQueue.main.async {
                    self.places = response.mapItems.map(Place.init)
                }
            }
        }
        
        func getCurrentLocationName() {
            let geocoder = CLGeocoder()
            guard let location = locationManager.location else { return }
            geocoder.reverseGeocodeLocation(location, preferredLocale: .current) { placemarks, error in
                guard let placeName = placemarks?.first, error == nil else { return }
                
                if let locality = placeName.locality {
                    self.placeName = locality
                }
                
                if let admRegion = placeName.administrativeArea {
                    self.placeName += ", \(admRegion)"
                }
            }
        }
        
        init(onSave: @escaping () -> Void) {
            self.onSave = onSave
        }
    }
}
