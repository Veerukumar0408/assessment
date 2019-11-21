//
//  ViewController.swift
//  JobAssessment
//
//  Created by Mr. Naveen Kumar on 19/11/19.
//  Copyright © 2019 delta. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps
import MapKit
//import Alamofire
class pin:NSObject,MKAnnotation{
    var coordinate: CLLocationCoordinate2D
    var title: String?
    var subtitle: String?
    init(pinTitle:String,pinSubTitle:String,location:CLLocationCoordinate2D) {
        self.title = pinTitle
        self.subtitle = pinSubTitle
        self.coordinate = location
    }
}
struct State {
    let name: String
    let long: CLLocationDegrees
    let lat: CLLocationDegrees
    let color:UIColor
}
class ViewController: UIViewController {
  
    override func viewDidLoad() {
        super.viewDidLoad()
        let camera = GMSCameraPosition.camera(withLatitude: 20.593683, longitude: 78.962883, zoom: 6.0)
         let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        
        
           view = mapView


           let states = [
            State(name: "Panchukula", long: 76.8606, lat: 30.694208,color: .green),
            State(name: "Chennai Airport", long: 80.1709, lat: 12.9941,color: .blue),
            State(name: "Mumbai Airport", long: 72.8656, lat: 19.0896,color: .red)
           ]
        for state in states {
            let marker = GMSMarker()
            marker.position = CLLocationCoordinate2D(latitude: state.lat, longitude: state.long)
            marker.title = state.name
            marker.snippet = "\(state.name)"
            marker.map = mapView
            
            marker.icon = GMSMarker.markerImage(with: state.color)
        }
    }
        
//        let currentlocation = CLLocationCoordinate2D(latitude: 30.694208, longitude: 30.694208)
//        let destinationlocation = CLLocationCoordinate2D(latitude: 12.9941, longitude: 80.1709)
//        let sourcepin = pin(pinTitle: "Panchkula", pinSubTitle: "Haryana", location: currentlocation)
//        let destinationpin = pin(pinTitle: "Chennai Airport", pinSubTitle: "Tamilnadu", location: destinationlocation)
        
    }
//    func fetchMapData() {
//
//        let directionURL = "https://maps.googleapis.com/maps/api/directions/json?" +
//            "origin=\(30.694208),\(30.694208)&destination=\(12.9941),\(80.1709)&" +
//        "key=YOUROWNSERVERKEY"
//
//
//
//        Alamofire.request(directionURL).responseJSON
//            { response in
//
//                if let JSON = response.result.value {
//
//                    let mapResponse: [String: AnyObject] = JSON as! [String : AnyObject]
//
//                    let routesArray = (mapResponse["routes"] as? Array) ?? []
//
//                    let routes = (routesArray.first as? Dictionary<String, AnyObject>) ?? [:]
//
//                    let overviewPolyline = (routes["overview_polyline"] as? Dictionary<String,AnyObject>) ?? [:]
//                    let polypoints = (overviewPolyline["points"] as? String) ?? ""
//                    let line  = polypoints
//
//                    self.addPolyLine(encodedString: line)
//            }
//        }
//
//    }
//
//    func addPolyLine(encodedString: String) {
//
//        let path = GMSMutablePath(fromEncodedPath: encodedString)
//        let polyline = GMSPolyline(path: path)
//        polyline.strokeWidth = 5
//        polyline.strokeColor = .blue
//
//
//    }




